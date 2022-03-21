
LOAD DATA LOCAL INFILE '/home/da9ni5el/Escritorio/MIA/Practica1/ArchivosCSV/transactions.csv'
INTO TABLE ida_ibrd.transaction_temp
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(transaction_id, project_id, transaction_isodate, transaction_year,
 transaction_value_code, transaction_currency, transaction_value);