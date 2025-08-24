-- create the tables and nwicu schema

-- creating schemas

DROP SCHEMA IF EXISTS hosp CASCADE;
CREATE SCHEMA hosp;
DROP SCHEMA IF EXISTS icu CASCADE;
CREATE SCHEMA icu;

-- creating tables

-- hosp schema

SET search_path TO hosp;

DROP TABLE IF EXISTS hosp.admissions CASCADE;
CREATE TABLE hosp.admissions
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  admittime TIMESTAMP NOT NULL,
  dischtime TIMESTAMP,
  deathtime TIMESTAMP,
  admission_type VARCHAR(40),
  admit_provider_id VARCHAR(40),
  admission_location VARCHAR(255),
  discharge_location VARCHAR(255),
  insurance VARCHAR(255),
  language VARCHAR(100),
  marital_status VARCHAR(30),
  race VARCHAR(80),
  edregtime TIMESTAMP,
  edouttime TIMESTAMP,
  hospital_expire_flag SMALLINT
);

DROP TABLE IF EXISTS hosp.diagnoses_icd CASCADE;
CREATE TABLE hosp.diagnoses_icd
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  seq_num INTEGER NOT NULL,
  icd_code CHAR(70),
  icd_version SMALLINT
);

DROP TABLE IF EXISTS hosp.d_icd_diagnoses CASCADE;
CREATE TABLE hosp.d_icd_diagnoses
(
  icd_code CHAR(70) NOT NULL,
  icd_version SMALLINT NOT NULL,
  long_title VARCHAR(255)
);

DROP TABLE IF EXISTS hosp.d_labitems CASCADE;
CREATE TABLE hosp.d_labitems
(
  itemid INTEGER NOT NULL,
  label VARCHAR(50),
  fluid VARCHAR(50),
  category VARCHAR(50)
);

DROP TABLE IF EXISTS hosp.emar CASCADE;
CREATE TABLE hosp.emar
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER,
  emar_id VARCHAR(25) NOT NULL,
  emar_seq INTEGER NOT NULL,
  poe_id VARCHAR(25) NOT NULL,
  pharmacy_id INTEGER,
  enter_provider_id VARCHAR(10), 
  charttime TIMESTAMP NOT NULL,
  medication TEXT,
  event_txt VARCHAR(100),
  scheduletime TIMESTAMP,
  storetime TIMESTAMP NOT NULL
);

DROP TABLE IF EXISTS hosp.labevents CASCADE;
CREATE TABLE hosp.labevents
(
  labevent_id INTEGER NOT NULL,
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER,
  specimen_id INTEGER,
  itemid INTEGER NOT NULL,
  order_provider_id VARCHAR(20), 
  charttime TIMESTAMP(0),
  storetime TIMESTAMP(0),
  value VARCHAR(200),
  valuenum DOUBLE PRECISION,
  valueuom VARCHAR(20),
  ref_range_lower DOUBLE PRECISION,
  ref_range_upper DOUBLE PRECISION,
  flag VARCHAR(10),
  priority VARCHAR(10),
  comments TEXT
);

DROP TABLE IF EXISTS hosp.patients CASCADE;
CREATE TABLE hosp.patients
(
  subject_id INTEGER NOT NULL,
  gender CHAR(1) NOT NULL,
  anchor_age SMALLINT,
  anchor_year SMALLINT NOT NULL,
  anchor_year_group VARCHAR(20) NOT NULL,
  dod DATE
);

DROP TABLE IF EXISTS hosp.prescriptions CASCADE;
CREATE TABLE hosp.prescriptions
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  pharmacy_id INTEGER NOT NULL,
  poe_id VARCHAR(25),
  poe_seq INTEGER,
  order_provider_id VARCHAR(250),
  starttime TIMESTAMP(3),
  stoptime TIMESTAMP(3),
  drug_type VARCHAR(255),
  drug VARCHAR(255) NOT NULL,
  formulary_drug_cd VARCHAR(120),
  gsn VARCHAR(255),
  ndc VARCHAR(25),
  prod_strength VARCHAR(255),
  form_rx VARCHAR(250),
  dose_val_rx VARCHAR(100),
  dose_unit_rx VARCHAR(250),
  form_val_disp VARCHAR(250),
  form_unit_disp VARCHAR(250),
  doses_per_24_hrs REAL,
  route VARCHAR(50)
);

-- icu schema

SET search_path TO icu;

DROP TABLE IF EXISTS icu.chartevents CASCADE;
CREATE TABLE icu.chartevents
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  stay_id INTEGER NOT NULL,
  caregiver_id INTEGER,
  charttime TIMESTAMP NOT NULL,
  storetime TIMESTAMP,
  itemid INTEGER NOT NULL,
  value VARCHAR(200),
  valuenum FLOAT,
  valueuom VARCHAR(20),
  warning SMALLINT
);

DROP TABLE IF EXISTS icu.d_items CASCADE;
CREATE TABLE icu.d_items
(
  itemid INTEGER NOT NULL,
  label VARCHAR(250) NOT NULL,
  abbreviation VARCHAR(50),
  linksto VARCHAR(30) NOT NULL,
  category VARCHAR(50),
  unitname VARCHAR(50),
  param_type VARCHAR(20) NOT NULL,
  lownormalvalue FLOAT,
  highnormalvalue FLOAT
);

DROP TABLE IF EXISTS icu.icustays CASCADE;
CREATE TABLE icu.icustays
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  stay_id INTEGER NOT NULL,
  first_careunit VARCHAR(255),
  last_careunit VARCHAR(255),
  intime TIMESTAMP,
  outtime TIMESTAMP,
  los FLOAT
);

DROP TABLE IF EXISTS icu.procedureevents CASCADE;
CREATE TABLE icu.procedureevents
(
  subject_id INTEGER NOT NULL,
  hadm_id INTEGER NOT NULL,
  stay_id INTEGER NOT NULL,
  caregiver_id INTEGER,
  starttime TIMESTAMP NOT NULL,
  endtime TIMESTAMP,
  storetime TIMESTAMP,
  itemid INTEGER NOT NULL,
  value FLOAT,
  valueuom VARCHAR(250),
  location VARCHAR(100),
  locationcategory VARCHAR(250),
  orderid INTEGER,
  linkorderid INTEGER,
  ordercategoryname VARCHAR(250),
  ordercategorydescription VARCHAR(230),
  patientweight FLOAT,
  isopenbag SMALLINT,
  continueinnextdept SMALLINT,
  statusdescription VARCHAR(220),
  originalamount FLOAT,
  originalrate FLOAT
);