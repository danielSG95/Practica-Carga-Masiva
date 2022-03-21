

CREATE TEMPORARY TABLE location_temp (
    location_type_code VARCHAR(25),
    location_type_name VARCHAR(100)
);

CREATE TEMPORARY TABLE transaction_temp (
    transaction_id VARCHAR(100),
    project_id VARCHAR(100),
    transaction_isodate VARCHAR(10),
    transaction_year INT ,
    transaction_value_code VARCHAR(5) ,
    transaction_currency VARCHAR(10) ,
    transaction_value DOUBLE 
);

CREATE TEMPORARY TABLE projects_temp (
    project_id VARCHAR(50) ,
    is_geocoded VARCHAR(5) ,
    project_title VARCHAR(100) ,
    start_actual_isodate VARCHAR(10) ,
    end_actual_isodate VARCHAR(10) ,
    donors VARCHAR(50) ,
    donors_iso3 VARCHAR(10) ,
    recipients VARCHAR(50) ,
    recipients_iso3 VARCHAR(5) ,
    ad_sector_codes VARCHAR(50) ,
    ad_sector_names VARCHAR(100) ,
    status_ VARCHAR(50) ,
    transaction_start_year INT ,
    transaction_end_year INT ,
    total_commitments FLOAT ,
    total_disbursements FLOAT
);

CREATE TEMPORARY TABLE level_1a_temp (
    project_id VARCHAR (50) ,
    geoname_id INT ,
    project_location_id VARCHAR(50) ,
    transactions_start_year INT ,
    transaction_end_year INT ,
    even_split_commitments FLOAT ,
    even_split_disbursements FLOAT 
);

CREATE TEMPORARY TABLE geonames_temp (
    geoname_id INT ,
    place_name VARCHAR(100) ,
    latitude FLOAT,
    longitud FLOAT,
    location_type_code VARCHAR(25) ,
    location_type_name VARCHAR(100),
    gazetter_adm_code VARCHAR(100) ,
    gazetter_adm_name VARCHAR(100) ,
    location_class INT ,
    geographic_exactness INT 
);

#En esta tabla hay muchos valores nulos en el archivo
CREATE TEMPORARY TABLE country_codes_temp (
    name_ VARCHAR(100) ,
    iso2 VARCHAR(5) ,
    name_name VARCHAR(100) ,
    name_aiddata_code INT,
    name_aiddata_name VARCHAR(100),
    name_cow_alpha VARCHAR(50),
    name_cow_numeric INT, 
    name_fao_code INT, 
    name_fips VARCHAR (5),
    name_geonames_id INT,
    name_imf_code INT,
    name_iso2 VARCHAR(5),
    name_iso3 VARCHAR(5),
    name_iso_numeric INT,
    name_oecd_code INT,
    name_oecd_name VARCHAR(50),
    name_un_code INT,
    name_wb_code VARCHAR(50)
);

