

LOAD DATA LOCAL INFILE '/home/da9ni5el/Escritorio/MIA/Practica1/ArchivosCSV/level_1a.csv'
INTO TABLE ida_ibrd.level_1a_temp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(project_id, project_location_id, geoname_id, transactions_start_year, transaction_end_year,
 even_split_commitments, even_split_disbursements);
