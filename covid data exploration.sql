
/*
Covid 19 Data Exploration 

Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types

*/


select *
from Project1..CovidDeaths
where continent is not null
order by 3,4



-- Select Data that we are going to be starting with
select location,date,total_cases,new_cases,total_deaths,population
from Project1..CovidDeaths
order by 1,2



-- Total Cases vs Total Deaths
-- Death percentage in India
select Location,date,total_cases,total_deaths,
    case
        when isnumeric(total_deaths) = 1 and isnumeric(total_cases) = 1
        then (convert(float, total_deaths) / convert(float, total_cases)) * 100
        else null
    end as DeathPercentage
from Project1..CovidDeaths
where Location LIKE 'India'
order by 1,2



-- Total Cases vs Population
-- Shows what percentage of population infected with Covid
select Location,date,population,total_cases, (total_cases/population) * 100 as CasePercentage
from Project1..CovidDeaths
where Location LIKE 'India'
order by 1,2



-- Countries with Highest Infection Rate
select Location,population,max(total_cases) as HighestInfectionCount, 
max((total_cases)/population) * 100 as InfectionRate
from Project1..CovidDeaths
group by location, population
order by InfectionRate desc



-- Death Count in each Continent
select continent,max(cast(total_deaths as int)) as TotalDeathCount
from Project1..CovidDeaths
where continent is not null
group by continent
order by TotalDeathCount desc



-- Countries with Highest Death Count per population
select Location,max(cast(total_deaths as int)) as TotalDeathCount
from Project1..CovidDeaths
where continent is not null
group by location
order by TotalDeathCount desc



-- Global Numbers
select sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_deaths,sum(cast
(new_deaths as int))/sum(New_Cases) * 100 as DeathPercentage
from Project1..CovidDeaths
--Where location like '%states%'
where continent is not null 
--Group By date
order by 1,2



-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
sum(cast(vac.new_vaccinations as int)) over (partition by vac.location order by dea.location,dea.date) as total_vaccinations
from Project1..CovidDeaths dea
join Project1..CovidVaccinations vac
on dea.location = vac.location and
dea.date = vac.date
where dea.continent is not null
order by 2,3



-- Using CTE to perform Calculation on Partition By in previous query
-- Percentage of Population Vaccinated
with PopVac (continent,location,date,population,new_vaccinations,Vacc_Per_Country)
as
(
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
sum(cast(vac.new_vaccinations as bigint)) over (partition by vac.location order by dea.location,dea.date) as total_vaccinations
from Project1..CovidDeaths dea
join Project1..CovidVaccinations vac
on dea.location = vac.location and
dea.date = vac.date
where dea.continent is not null
)
select *, (Vacc_Per_Country/population) * 100 as Percent_Vacinated
from PopVac



-- Using Temp Table to perform Calculation on Partition By in previous query
drop table if exists #PopulationVaccinated
create table #PopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
NewVaccination numeric,
TotalVaccinations numeric
)

insert into #PopulationVaccinated
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
sum(cast(vac.new_vaccinations as bigint)) over (partition by vac.location order by dea.location,dea.date) as total_vaccinations
from Project1..CovidDeaths dea
join Project1..CovidVaccinations vac
on dea.location = vac.location and
dea.date = vac.date
where dea.continent is not null

select *, (TotalVaccinations/Population) * 100 as PercentVacinated
from #PopulationVaccinated



-- Creating View to store data for visualizations

drop view if exists PopulationVaccinated

create view Populationvaccinated as
select dea.continent,dea.location,dea.date,dea.population,vac.new_vaccinations,
sum(cast(vac.new_vaccinations as bigint)) over (partition by vac.location order by dea.location,dea.date) as total_vaccinations
from Project1..CovidDeaths dea
join Project1..CovidVaccinations vac
on dea.location = vac.location and
dea.date = vac.date
where dea.continent is not null

select * from PopulationVaccinated
