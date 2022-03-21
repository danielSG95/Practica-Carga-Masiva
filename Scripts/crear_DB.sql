
CREATE TABLE status_ (
	cod_status INTEGER NOT NULL AUTO_INCREMENT,
    type_status VARCHAR(50) UNIQUE,
    PRIMARY KEY ( cod_status )
);

CREATE TABLE country_codes (
	cod_country INTEGER NOT NULL AUTO_INCREMENT,
    name_ VARCHAR(100),
    iso2 VARCHAR(100),
    name_name VARCHAR(100),
    name_aiddata_code INTEGER,
    name_aiddata_name VARCHAR(100),
    name_cow_alpha VARCHAR(100),
    name_cow_numeric INTEGER,
    name_fao_code INTEGER,
    name_fips VARCHAR(100),
    name_imf_code INTEGER,
    name_iso2 VARCHAR(5),
    name_iso3 VARCHAR(5),
    name_iso_numeric INTEGER,
    name_oecd_code INTEGER,
    name_oecd_name VARCHAR(100),
    name_un_code INTEGER,
    name_wb_code VARCHAR(100),
    PRIMARY KEY ( cod_country )
);

CREATE TABLE project (
	project_id INTEGER NOT NULL AUTO_INCREMENT,
    project_code VARCHAR(50),
    is_geocoded CHAR(2), #se usa bien asi? 
    project_title VARCHAR(100),
    start_actual_isodate VARCHAR(10),
    end_actual_isodate VARCHAR(10),
    donors VARCHAR(100),
    donors_iso3 VARCHAR(100),
    transaction_start_year INTEGER,
    transaction_end_year INTEGER,
    total_commitments FLOAT,
    total_disbursements FLOAT,
    ad_sector_codes VARCHAR(100),
    ad_sector_names VARCHAR(100),
    recipients VARCHAR(100),
    recipients_iso3 VARCHAR(100),
    cod_status INTEGER NOT NULL,
    cod_country INTEGER NOT NULL,
    PRIMARY KEY ( project_id ),
    FOREIGN KEY ( cod_status ) 
		REFERENCES status_ ( cod_status ),
	FOREIGN KEY ( cod_country )
		REFERENCES country_codes ( cod_country )
);

CREATE TABLE currency (
	cod_currency INTEGER NOT NULL AUTO_INCREMENT,
    type_currency VARCHAR(10) UNIQUE,
    PRIMARY KEY ( cod_currency )    
);

CREATE TABLE transactions (
	transaction_code INTEGER NOT NULL AUTO_INCREMENT,
	transaction_id VARCHAR(100) NOT NULL,
    project_id INTEGER NOT NULL,
    transaction_isodate VARCHAR(10),
    transaction_year INTEGER,
    transaction_value_code CHAR(5),
    transaction_value DOUBLE,
    cod_currency INTEGER NOT NULL,
    PRIMARY KEY ( transaction_code ),
    FOREIGN KEY ( project_id )
		REFERENCES project ( project_id ),
	FOREIGN KEY ( cod_currency )
		REFERENCES currency ( cod_currency )
);

CREATE TABLE location (
	cod_location INTEGER NOT NULL AUTO_INCREMENT,
	location_type_code VARCHAR(25) NOT NULL, #Cambiar esto!! 
    location_type_name VARCHAR(100),
    PRIMARY KEY ( cod_location )
);

CREATE TABLE geonames (
	geoname_id INTEGER NOT NULL AUTO_INCREMENT,
    cod_location INTEGER NOT NULL,
    place_name VARCHAR(100),
    latitude FLOAT,
    longitud FLOAT,
    gazetter_adm_code VARCHAR(100), #Estos podria ser una tabla mas? 
    gazetter_adm_name VARCHAR(100), 
    location_class INTEGER,
    geographic_exactness INTEGER,
    PRIMARY KEY ( geoname_id ),
    FOREIGN KEY ( cod_location )
		REFERENCES location ( cod_location )
);

CREATE TABLE level_1a (
	geoname_id INTEGER, -- NOT NULL, 
    project_id INTEGER NOT NULL, 
    even_split_commitments FLOAT, 
    even_split_disbursements FLOAT,
    FOREIGN KEY ( geoname_id ) 
		REFERENCES geonames ( geoname_id )
		ON UPDATE CASCADE
        ,
	FOREIGN KEY ( project_id )
		REFERENCES project ( project_id ),
	PRIMARY KEY ( geoname_id, project_id )
);

-- DELIMITER $$ 
-- CREATE TRIGGER comprobar_values BEFORE INSERT ON country_codes 
-- 	FOR EACH ROW BEGIN
-- 		IF new.name_ = 'Unspecified' THEN
-- 			SIGNAL SQLSTATE '45000';
-- 		END IF;
-- END; $$


