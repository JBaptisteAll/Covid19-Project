-- Trying to show corelation between New test & New cases per date

--Join By location
SELECT dea.location, dea.date, dea.new_cases, vac.location, vac.date, vac.new_tests
FROM CovidDeaths dea
join CovidVaccinations vac
	on dea.location = vac.location
	
--Join By date
SELECT dea.location, dea.date, dea.new_cases, vac.location, vac.date, vac.new_tests
FROM CovidDeaths dea
full outer join CovidVaccinations vac
	on dea.date = vac.date

--Join By location
SELECT dea.location, dea.date, dea.new_cases, vac.location, vac.date, vac.new_tests
FROM CovidDeaths dea
join CovidVaccinations vac
	on dea.location = vac.location
	order by dea.location
	
-- Got IT!!!
SELECT dea.location, dea.date, dea.new_cases, vac.location, vac.date, vac.new_tests
FROM CovidDeaths dea
join CovidVaccinations vac
	on dea.date = vac.date
	order by dea.location, vac.location

-- Join By location and date
SELECT dea.location, dea.date, dea.new_cases, vac.location, vac.date, vac.new_tests
FROM CovidDeaths dea
join CovidVaccinations vac
	on dea.date = vac.date
	and dea.location = vac.location
	order by dea.location, vac.location

--PERFECT
SELECT dea.location, dea.date, dea.new_cases, vac.location, vac.date, vac.new_tests
FROM CovidDeaths dea
join CovidVaccinations vac
	on dea.date = vac.date
	and dea.location = vac.location
WHERE vac.new_tests IS NOT NULL and
	dea.new_cases IS NOT NULL 
	order by dea.location, vac.location
	
-- Perfect By Country of choice
SELECT dea.location, dea.date, dea.new_cases, vac.location, vac.date, vac.new_tests
FROM CovidDeaths dea
join CovidVaccinations vac
	on dea.date = vac.date
	and dea.location = vac.location
WHERE vac.new_tests IS NOT NULL and
	dea.new_cases IS NOT NULL and
	dea.location = 'Belgium'
order by dea.location, vac.location