# Crowdfunding_ETL

An ETL project using Python, Pandas and Postgres to extract data from Excel files and upload it into a database.

The crowdfunding dataset has been extracted via the following notebooks:

- Category and Subcategory data, by Kashif in `ETL_Mini_Project_KBashir.ipynb`
- Campaign data, by Helena in `ETL_Mini_Project_HChen.ipynb`
- Contacts data, by Tom in `ETL_Mini_Project_TPisel.ipynb`

`Resources/` contains the excel files to be read and the generated csv files.

`Database/` contains scripts to generate the database, including:

- Table schema `crowdfunding_db_schema.sql`
- Diagram `db_diagram.png`
- Script to create and populate the database `create_db.sh`

The script can be run from terminal with `sh Database/create_db.sh`

Ensure you are in the root directory of the project and have a localhost postgres instance and psql.

No external code has been used in this project, except where provided as part of the assignment resources.