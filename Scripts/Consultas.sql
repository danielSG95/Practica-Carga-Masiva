

#¿Cuántos proyectos iniciaron en el 2011?
SELECT COUNT( p.start_actual_isodate ) FROM project p
WHERE  p.start_actual_isodate = 2011 ;

#¿Cuál fue el proyecto de mayor duración?
SELECT t.project_code, t.project_title, MAX(t.transaction_end_year - t.transaction_start_year) AS Tiempo
FROM project t, status_ s
WHERE s.cod_status = t.cod_status AND  s.cod_status = 2
GROUP BY t.project_code
ORDER BY Tiempo DESC
LIMIT 1;

#¿Cuál fue el proyecto de menor duración?
SELECT t.project_code, t.project_title, MIN(t.transaction_end_year - t.transaction_start_year) as Tiempo
FROM project t, status_ s
WHERE s.cod_status = t.cod_status AND  s.cod_status = 2
GROUP BY t.project_code
ORDER BY Tiempo ASC
LIMIT 1;

#Top 5 de países con más proyectos asignados
SELECT c.name_, COUNT( * ) AS Cantidad FROM project p, country_codes c 
WHERE p.recipients_iso3 = c.name_iso3
GROUP BY p.recipients_iso3
ORDER BY Cantidad DESC
LIMIT 5;

#Top 5 de países con menos proyectos asignados
SELECT c.name_, COUNT( * ) AS Cantidad FROM project p, country_codes c 
WHERE p.recipients_iso3 = c.name_iso3
GROUP BY p.recipients_iso3
ORDER BY Cantidad ASC
LIMIT 5;

#¿Cuál fue el proyecto con más costo?
SELECT p.project_id, p.project_code, p.project_title, MAX( p.total_commitments ) As Inversion
FROM project p, country_codes c
WHERE p.cod_country = c.cod_country
GROUP BY p.project_id
ORDER BY Inversion DESC
LIMIT 1;

#¿Cuál fue el proyecto menos costoso?
SELECT p.project_id, p.project_code, p.project_title, MIN( p.total_commitments ) AS Inversion
FROM project p, country_codes c
WHERE p.cod_country = c.cod_country
GROUP BY p.project_id
ORDER BY Inversion ASC
LIMIT 1;

#Top 5 de proyectos más costosos
SELECT p.project_id, p.project_code, p.project_title, MAX( p.total_commitments ) As Inversion
FROM project p, country_codes c
WHERE p.cod_country = c.cod_country
GROUP BY p.project_id
ORDER BY Inversion DESC
LIMIT 5;

#Costo Total de Todos los Proyectos
SELECT SUM( p.total_commitments ) AS Total
FROM project p
ORDER BY Total DESC
LIMIT 1;

#Top 3 de las Transacciones más Costosas RI-East Africa Public Health Laboratory Networking Project
SELECT p.project_code, t.transaction_id, p.project_title,  t.transaction_value AS transaccion 
FROM project p
INNER JOIN transactions t
ON t.project_id = p.project_id
WHERE p.project_title LIKE "%RI-East Africa Public Health Laboratory Networking Project"
ORDER BY transaccion DESC
LIMIT 3;
