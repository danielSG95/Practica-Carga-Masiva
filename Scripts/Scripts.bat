
USE ida_ibrd;
-- Eliminando tablas
source /home/da9ni5el/Escritorio/MIA/Practica1/Scripts/drop_tables.sql

-- Creando DB 
source /home/da9ni5el/Escritorio/MIA/Practica1/Scripts/crear_DB.sql

-- Creando Temporales
source /home/da9ni5el/Escritorio/MIA/Practica1/Scripts/tablas_temporales.sql

-- Cargando Country
source /home/da9ni5el/Escritorio/MIA/Practica1/Scripts/Carga_country_codes.sql

-- Cargando geonames
source /home/da9ni5el/Escritorio/MIA/Practica1/Scripts/Carga_geonames.sql

source /home/da9ni5el/Escritorio/MIA/Practica1/Scripts/Carga_level_1a.sql

source /home/da9ni5el/Escritorio/MIA/Practica1/Scripts/Carga_location.sql

source /home/da9ni5el/Escritorio/MIA/Practica1/Scripts/Carga_projects.sql

source /home/da9ni5el/Escritorio/MIA/Practica1/Scripts/Carga_transactions.sql

--Ejecutar el llenado de las tablas.
source /home/da9ni5el/Escritorio/MIA/Practica1/Scripts/Llenar_DB.sql