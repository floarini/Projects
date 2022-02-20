/*
Covid 19 Data Exploration 
Skills used: Joins, CTE's, Temp Tables, Windows Functions, Aggregate Functions, Creating Views, Converting Data Types
*/

USE Portfolio_project;

SELECT 
    *
FROM
    covid_deaths
WHERE
    continet IS NOT NULL
ORDER BY location , date;

-- Select data that we're going to start with

SELECT 
    location,
    date,
    total_cases,
    new_cases,
    total_deaths,
    population
FROM
    covid_deaths
WHERE
    continent IS NOT NULL
ORDER BY iso_code , continent;


-- Total cases VS total deaths
-- Purpose: to show the likelihood of dying when positive COVID in the country

SELECT 
    location,
    date,
    total_cases,
    total_deaths,
    (total_deaths / total_cases) * 100 AS death_percentage
FROM
    covid_deaths
WHERE
    location AND continent IS NOT NULL
ORDER BY iso_code , continent;


-- Total cases VS population
-- Purpose: to show the percentage of population infected with COVID

SELECT 
    location,
    date,
    population,
    total_cases,
    (total_cases / population) * 100 AS percent_population_infected
FROM
    covid_deaths
ORDER BY iso_code , continent;

-- Countries with higest infection rate compared to its population

SELECT 
    location,
    population,
    MAX(total_cases) AS higest_infection_count,
    MAX(total_cases / population) * 100 AS percent_population_infected
FROM
    covid_deaths
GROUP BY location , population
ORDER BY percent_population_infected DESC;

-- Countries with higest death count per population

