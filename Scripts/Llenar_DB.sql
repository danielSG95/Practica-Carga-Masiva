
#Llenando Location
INSERT INTO location ( location_type_code, location_type_name )
SELECT * FROM location_temp\g


#Llenando geonames
INSERT INTO geonames (
geoname_id,
place_name, 
latitude, 
longitud, 
cod_location, 
gazetter_adm_code, 
gazetter_adm_name, 
location_class, 
geographic_exactness)
SELECT 
t.geoname_id,
t.place_name, 
t.latitude,
t.longitud,
l.cod_location, 
t.gazetter_adm_code, 
t.gazetter_adm_name,
t.location_class, 
t.geographic_exactness
FROM geonames_temp t
INNER JOIN location l
ON t.location_type_code = l.location_type_code
WHERE t.location_type_name = l.location_type_name #esto se puede quitar? 
GROUP BY t.geoname_id\g 
	

#Llenando Country_Codes
INSERT INTO country_codes (
name_,
iso2,
name_name,
name_aiddata_code,
name_aiddata_name,
name_cow_alpha,
name_cow_numeric,
name_fao_code,
name_fips,
name_imf_code,
name_iso2,
name_iso3,
name_iso_numeric,
name_oecd_code,
name_oecd_name,
name_un_code,
name_wb_code
)
SELECT
DISTINCT c.name_,
c.iso2,
c.name_name,
c.name_aiddata_code,
c.name_aiddata_name,
c.name_cow_alpha,
c.name_cow_numeric,
c.name_fao_code,
c.name_fips,
c.name_imf_code,
c.name_iso2,
c.name_iso3,
c.name_iso_numeric,
c.name_oecd_code,
c.name_oecd_name,
c.name_un_code,
c.name_wb_code
FROM country_codes_temp c\g

#Llenando status 
INSERT INTO status_ ( type_status )
SELECT DISTINCT p.status_ FROM projects_temp p \g


#Llenando Project

INSERT INTO project(
project_code,
is_geocoded,
project_title,
start_actual_isodate,
end_actual_isodate,
donors,
donors_iso3,
transaction_start_year,
transaction_end_year,
total_commitments,
total_disbursements,
ad_sector_codes,
ad_sector_names,
recipients,
recipients_iso3,
cod_status,
cod_country
)
SELECT
p.project_id,
p.is_geocoded,
p.project_title,
#str_to_date(Temp_projects.start_actual_isodate , '%d/%m/%Y'),
str_to_date(p.start_actual_isodate , '%d/%m/%Y'),
str_to_date(p.end_actual_isodate , '%d/%m/%Y'),
-- p.start_actual_isodate,
-- p.end_actual_isodate, 
p.donors, 
p.donors_iso3,
p.transaction_start_year, 
p.transaction_end_year, 
p.total_commitments, 
p.total_disbursements,
p.ad_sector_codes, 
p.ad_sector_names,
p.recipients,
p.recipients_iso3,
s.cod_status,
c.cod_country
FROM projects_temp p
INNER JOIN country_codes c
ON p.recipients_iso3 = c.name_iso3
INNER JOIN status_ s
ON p.status_ = s.type_status
GROUP BY p.project_id\g

#Llenando currency 
INSERT INTO currency ( type_currency )
SELECT DISTINCT t.transaction_currency FROM transaction_temp t\g

#Llenando Transaction
INSERT INTO transactions(
transaction_id,
transaction_isodate,
transaction_year, 
transaction_value_code,
transaction_value, 
cod_currency, 
project_id
)
SELECT
t.transaction_id,
t.transaction_isodate,
t.transaction_year, 
t.transaction_value_code,
t.transaction_value,
c.cod_currency,
p.project_id
FROM transaction_temp t
INNER JOIN currency c
ON t.transaction_currency = c.type_currency
INNER JOIN project p
ON t.project_id = p.project_code
GROUP BY t.transaction_id\g

#Llenando level_1a
INSERT IGNORE INTO level_1a(
even_split_commitments,
even_split_disbursements,
geoname_id,
project_id
)
SELECT
l.even_split_commitments,
l.even_split_disbursements,
l.geoname_id,
p.project_id
FROM level_1a_temp l
INNER JOIN project p
ON l.project_id = p.project_code\g







