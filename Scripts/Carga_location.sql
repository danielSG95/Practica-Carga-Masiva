
LOAD DATA LOCAL INFILE '/home/da9ni5el/Escritorio/MIA/Practica1/ArchivosCSV/locations.csv'
INTO TABLE ida_ibrd.location_temp
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(location_type_code, location_type_name);
