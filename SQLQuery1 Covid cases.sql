Select *
From PortfolioProject..['Covid deaths]
where continent is not null 
order by 3,4


--Select *
--From PortfolioProject..['Covid vaccinations]
--order by 3,4


--Select Data that we are gioing to be using 

Select Location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..['Covid deaths]
where continent is not null 
order by 1,2
 


--Looking at Total Cases vs Total deaths 
--shows likelihood of dying if you contract covid in your country 
Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..['Covid deaths]
Where location like '%states%'
and continent is not null 
order by 1,2



--Looking at Total cases vs Population 
--Shows what percentage of population got Covid

Select Location, date, Population, total_cases, (total_cases/population)*100 as DeathPercentage
From PortfolioProject..['Covid deaths]
--Where location like '%states%'
order by 1,2

--Looking at Countries with Highest Infection Rate comapare to Population 

Select Location, Population, Max(total_cases) as HighestInfectionCount, Max((total_cases/population))*100 as 
PercentPopulationInfected 
From PortfolioProject..['Covid deaths]
--Where location like '%states%'
Group by Location, Population 
order by PercentPopulationInfected desc


--Showing countries with Highest Death Count per Population 

Select Location, Max(cast(Total_deaths as int))as TotalDeathCount 
From PortfolioProject..['Covid deaths]
--Where location like '%states%'
where continent is not null 
Group by Location
order by TotalDeathCount desc

--LET'S BREAK THINGS DOW BY CONTINENT


Select location, Max(cast(Total_deaths as int))as TotalDeathCount 
From PortfolioProject..['Covid deaths]
--Where location like '%states%'
where continent is not null 
Group by location
order by TotalDeathCount desc

--LET'S BREAK THINGS DOWN BY CONTINENT
--Showing continents with the highest death count per population 

Select location, Max(cast(Total_deaths as int))as TotalDeathCount 
From PortfolioProject..['Covid deaths]
--Where location like '%states%'
where continent is not null 
Group by location
order by TotalDeathCount desc


--GLOBAL NUMBERS

Select SUM(new_cases)as total_cases, SUM (cast(new_deaths as int)), SUM(cast(new_deaths as int))as total_deaths, SUM (New_Cases)*100 as DeathPercentage
 From PortfolioProject..['Covid deaths]
--Where location like '%states%'
where continent is not null
--Group By date 
order by 1,2



