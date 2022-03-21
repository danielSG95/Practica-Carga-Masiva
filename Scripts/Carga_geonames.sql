

LOAD DATA LOCAL INFILE '/home/da9ni5el/Escritorio/MIA/Practica1/ArchivosCSV/geonames.csv'
INTO TABLE ida_ibrd.geonames_temp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(geoname_id, place_name, latitude, longitud, location_type_code, location_type_name, 
gazetter_adm_code, gazetter_adm_name, location_class, geographic_exactness);