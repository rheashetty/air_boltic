Welcome!

DESCRIPTION

This project creates a rough data model based on air_boltic dataset and necessary requirements.
The project can be executed using steps mentioned below in the setup section. A postgres database is launched via docker for this.

Data Structure:
1. Raw Data Layer:
   The raw data provided in csv and json files is placed in the raw data folder. The raw data is loaded in the public schema of postgres during database initialization. We take the ELT approach.
   The data will reside in public schema as tables.
2. Staging Layer
   Staging views are created on top of these raw data tables, this gives the space to clean data and maintain data quality before we transform data into models. Views are present in models>staging folder.
   The views reside in analytics_staging schema.
3. Mart Layer
   The data is further transformed into a dimenisonal model. The model is based on kimball architecture but is not rigid. We have dimensions and fact tables. They are present in models>marts folder.
   The tables reside in analytics schema.

A screenshot of final dbt docs (graphical representation) is placed in screenshots folder.

SETUP

1. Download Docker Desktop using the official website, install and launch.
2. Clone the forked repo to your device.
3. Open your Command Prompt, navigate to that folder, and run the command docker compose up.
4. Now you have launched a local Postgres database with the following credentials:
    Host: localhost
    User: admin
    Password: admin
    Port: 5432 
5. (Optional) Connect to the db via a preferred tool
6. Install dbt-core and dbt-postgres using pip (if you don’t have) on your preferred environment.
7. Run the command dbt run