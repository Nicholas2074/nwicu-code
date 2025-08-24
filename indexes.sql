-- indexes for all nwicu modules

-- hosp schema

SET search_path TO hosp;

-- admissions

DROP INDEX IF EXISTS admissions_idx01;
CREATE INDEX admissions_idx01
  ON admissions (admittime, dischtime, deathtime);

-- d_icd_diagnoses

DROP INDEX IF EXISTS D_ICD_DIAG_idx02;
CREATE INDEX D_ICD_DIAG_idx02
  ON D_ICD_DIAGNOSES (LONG_TITLE);

-- d_labitems

DROP INDEX IF EXISTS d_labitems_idx01;
CREATE INDEX d_labitems_idx01
  ON d_labitems (label, fluid, category);

-- emar

DROP INDEX IF EXISTS emar_idx01;
CREATE INDEX emar_idx01
  ON emar (poe_id);

DROP INDEX IF EXISTS emar_idx02;
CREATE INDEX emar_idx02
  ON emar (pharmacy_id);

DROP INDEX IF EXISTS emar_idx03;
CREATE INDEX emar_idx03
  ON emar (charttime, scheduletime, storetime);

DROP INDEX IF EXISTS emar_idx04;
CREATE INDEX emar_idx04
  ON emar (medication);

-- labevents

DROP INDEX IF EXISTS labevents_idx01;
CREATE INDEX labevents_idx01
  ON labevents (charttime, storetime);

DROP INDEX IF EXISTS labevents_idx02;
CREATE INDEX labevents_idx02
  ON labevents (specimen_id);

-- patients
DROP INDEX IF EXISTS patients_idx01;
CREATE INDEX patients_idx01
  ON patients (anchor_age);

DROP INDEX IF EXISTS patients_idx02;
CREATE INDEX patients_idx02
  ON patients (anchor_year);

-- prescriptions

DROP INDEX IF EXISTS prescriptions_idx01;
CREATE INDEX prescriptions_idx01
  ON prescriptions (starttime, stoptime);

SET search_path TO nwsci;

-- icu schema

-- chartevents

DROP INDEX IF EXISTS chartevents_idx01;
CREATE INDEX chartevents_idx01
  ON chartevents (charttime, storetime);

-- d_items

DROP INDEX IF EXISTS d_items_idx01;
CREATE INDEX d_items_idx01
  ON d_items (label, abbreviation);

DROP INDEX IF EXISTS d_items_idx02;
CREATE INDEX d_items_idx02
  ON d_items (category);

-- icustays

DROP INDEX IF EXISTS icustays_idx01;
CREATE INDEX icustays_idx01
  ON icustays (first_careunit, last_careunit);

DROP INDEX IF EXISTS icustays_idx02;
CREATE INDEX icustays_idx02
  ON icustays (intime, outtime);

-- procedureevents

DROP INDEX IF EXISTS procedureevents_idx01;
CREATE INDEX procedureevents_idx01
  ON procedureevents (starttime, endtime);

DROP INDEX IF EXISTS procedureevents_idx02;
CREATE INDEX procedureevents_idx02
  ON procedureevents (ordercategoryname);