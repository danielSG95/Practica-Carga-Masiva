
USE ida_ibrd;
-- Eliminando tablas
source /run/media/daniel/SharedParti/Backup/LINUX/Escritorio/MIA/Primer Semestre/Practica1/Scripts/drop_tables.sql

-- Creando DB 
source /run/media/daniel/SharedParti/Backup/LINUX/Escritorio/MIA/Primer Semestre/Practica1/Scripts/crear_DB.sql

-- Creando Temporales
source /run/media/daniel/SharedParti/Backup/LINUX/Escritorio/MIA/Primer Semestre/Practica1/Scripts/tablas_temporales.sql

-- Cargando Country
source /run/media/daniel/SharedParti/Backup/LINUX/Escritorio/MIA/Primer Semestre/Practica1/Scripts/Carga_country_codes.sql

-- Cargando geonames
source /run/media/daniel/SharedParti/Backup/LINUX/Escritorio/MIA/Primer Semestre/Practica1/Scripts/Carga_geonames.sql

source /run/media/daniel/SharedParti/Backup/LINUX/Escritorio/MIA/Primer Semestre/Practica1/Scripts/Carga_level_1a.sql

source /run/media/daniel/SharedParti/Backup/LINUX/Escritorio/MIA/Primer Semestre/Practica1/Scripts/Carga_location.sql

source /run/media/daniel/SharedParti/Backup/LINUX/Escritorio/MIA/Primer Semestre/Practica1/Scripts/Carga_projects.sql

source /run/media/daniel/SharedParti/Backup/LINUX/Escritorio/MIA/Primer Semestre/Practica1/Scripts/Carga_transactions.sql

--Ejecutar el llenado de las tablas.
source /run/media/daniel/SharedParti/Backup/LINUX/Escritorio/MIA/Primer Semestre/Practica1/Scripts/Llenar_DB.sql
