-- load data into the nwicu schema

-- the script assumes the files are in the hosp and icu subfolders of nwicu

\cd /tmp/nwicu

-- making sure correct encoding is defined as -utf8- 
SET CLIENT_ENCODING TO 'utf8';

-- hosp schema
\cd nw_hosp

COPY hosp.admissions FROM PROGRAM 'gzip -dc /tmp/nwicu/nw_hosp/admissions.csv.gz' DELIMITER ',' CSV HEADER NULL '';
COPY hosp.diagnoses_icd FROM PROGRAM 'gzip -dc /tmp/nwicu/nw_hosp/diagnoses_icd.csv.gz' DELIMITER ',' CSV HEADER NULL '';
COPY hosp.d_icd_diagnoses FROM PROGRAM 'gzip -dc /tmp/nwicu/nw_hosp/d_icd_diagnoses.csv.gz' DELIMITER ',' CSV HEADER NULL '';
COPY hosp.d_labitems FROM PROGRAM 'gzip -dc /tmp/nwicu/nw_hosp/d_labitems.csv.gz' DELIMITER ',' CSV HEADER NULL '';
COPY hosp.emar FROM PROGRAM 'gzip -dc /tmp/nwicu/nw_hosp/emar.csv.gz' DELIMITER ',' CSV HEADER NULL '';
COPY hosp.labevents FROM PROGRAM 'gzip -dc /tmp/nwicu/nw_hosp/labevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
COPY hosp.patients FROM PROGRAM 'gzip -dc /tmp/nwicu/nw_hosp/patients.csv.gz' DELIMITER ',' CSV HEADER NULL '';
COPY hosp.prescriptions FROM PROGRAM 'gzip -dc /tmp/nwicu/nw_hosp/prescriptions.csv.gz' DELIMITER ',' CSV HEADER NULL '';

-- icu schema
\cd ../nw_icu

COPY icu.chartevents FROM PROGRAM 'gzip -dc chartevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';
COPY icu.d_items FROM PROGRAM 'gzip -dc d_items.csv.gz' DELIMITER ',' CSV HEADER NULL '';
COPY icu.icustays FROM PROGRAM 'gzip -dc icustays.csv.gz' DELIMITER ',' CSV HEADER NULL '';
COPY icu.procedureevents FROM PROGRAM 'gzip -dc procedureevents.csv.gz' DELIMITER ',' CSV HEADER NULL '';