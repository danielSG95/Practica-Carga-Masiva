

LOAD DATA LOCAL INFILE '/home/da9ni5el/Escritorio/MIA/Practica1/ArchivosCSV/projects.csv'
INTO TABLE ida_ibrd.projects_temp
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(project_id, is_geocoded, project_title, start_actual_isodate, end_actual_isodate,
 donors, donors_iso3, recipients, recipients_iso3, ad_sector_codes, ad_sector_names, status_,
 transaction_start_year, transaction_end_year, total_commitments, total_disbursements);