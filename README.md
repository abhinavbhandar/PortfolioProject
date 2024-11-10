# COVID-19 Data Trend Analysis

## Project Objective
This project analyzes global COVID-19 data, focusing on case trends, death rates, infection rates, and vaccination progress across countries and continents. By utilizing SQL and Tableau, this exploration aims to derive insights that can inform public health strategies and highlight pandemic impact patterns.


## Skills and Techniques Used
- **SQL Techniques**: Joins, CTEs, Temporary Tables, Window Functions, Aggregate Functions, Data Type Conversions, and Views.
- **Data Visualization**: Tableau dashboards for interactive exploration and analysis of COVID-19 data trends.
- **Analytical Skills**: Calculating infection rates, death percentages, and vaccination coverage.


## Data Analysis Steps
1. **De-normalization**:
   - Denormalize the Large data set into two tables : Covid deaths and Covid vaccination using Excel

2. **Initial Data Selection**: 
   - Loaded COVID-19 death data, filtering by fields such as location, date, total cases, new cases, total deaths, and          
     population.

3. **Case Fatality Rate**:
   - Calculated the death rate percentage for India using conditional logic to convert and divide total deaths by total cases.

4. **Infection Rate Analysis**:
   - Computed infection rate as a percentage of the population across countries to identify regions with the highest infection 
     burden.

5. **Continent-based Mortality Analysis**:
   - Aggregated death counts for each continent to reveal regional mortality patterns.

6. **Global Overview**:
   - Provided cumulative global numbers of COVID cases, deaths, and calculated the overall death percentage.

7. **Vaccination Progress**:
   - Joined vaccination data with COVID case data to analyze the percentage of population vaccinated across countries and 
     continents.

8. **Using CTEs and Temporary Tables**:
   - Created a CTE to calculate cumulative vaccination rates within each country.
   - Built a temporary table to calculate the percentage of vaccinated population for further analysis.

9. **Creating a View**:
   - Constructed a view (`PopulationVaccinated`) to store cumulative vaccination data for visualization.


## Key SQL Queries

**SQL Query:** [Link](https://github.com/abhinavbhandar/PortfolioProject/blob/main/covid%20data%20exploration.sql)
- **Death Rate Analysis**: Calculates death rates as a percentage of total cases per country.
- **Infection Rate by Population**: Determines which countries have the highest infection rates relative to their population.
- **Vaccination Progression**: Monitors the cumulative vaccination numbers as a percentage of the population per country.


## Tableau Data Visualization
This analysis is complemented by an interactive Tableau dashboard, providing visual insights into COVID-19 trends, mortality, and vaccination coverage.

- **Dashboard Link**: [COVID-19 Trend Analysis on Tableau](https://public.tableau.com/app/profile/abhinav.bhandari/viz/Covid-19TrendAnalysis_17102244341810/Dashboard1?publish=yes)
- **Dashboard Overview**: The Tableau dashboard visualizes key metrics such as infection rates, death percentages, and vaccination progress across countries and continents. Interactive elements allow users to filter data by location and date, offering a deeper understanding of pandemic trends.
  
- **Dashboard Screenshot**:  
  ![image](https://github.com/user-attachments/assets/7dcbda9e-7891-47cf-b562-dff6a62cb2e6)


## SQL Queries and Visuals Screenshot

![image](https://github.com/user-attachments/assets/3c557a20-b0e3-42fa-9752-96527e913592)
![image](https://github.com/user-attachments/assets/cf07ad73-08c3-453b-83e1-51f432562169)

![image](https://github.com/user-attachments/assets/3894f4cd-b2df-4e24-a9a5-ad49755152ec)
![image](https://github.com/user-attachments/assets/1f6b821f-267f-4705-9f21-91caab803f95)


## Key Insights
- **Europe’s Death Toll**: Europe has recorded the most COVID-19 deaths compared to other continents.
- **Income and Infection Correlation**: Higher-income individuals are more likely to be infected by COVID-19.
- **High Infection Rates in the West**: Western nations show the highest infection rates globally.
- **China and India’s Low Infection Rate**: Although China and India have the world’s largest populations, their infection rates remain relatively low.


## Conclusion
This exploration provides a comprehensive view of the COVID-19 pandemic’s spread, mortality impact, and vaccination progress across different regions. By combining sophisticated SQL analysis with interactive Tableau visualizations, this project establishes a foundation for public health insights and data-driven decision-making.

**Dataset** : [Link](https://github.com/abhinavbhandar/PortfolioProject/blob/main/covid-dataset.zip)

**SQL Query:** [Link](https://github.com/abhinavbhandar/PortfolioProject/blob/main/covid%20data%20exploration.sql)

**Dashboard Link**: [COVID-19 Trend Analysis on Tableau](https://public.tableau.com/app/profile/abhinav.bhandari/viz/Covid-19TrendAnalysis_17102244341810/Dashboard1?publish=yes)
