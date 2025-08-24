/* -------------------------------------------------------------------------- */
/*                            Creating Primary Keys                           */
/* -------------------------------------------------------------------------- */

-- hosp schema

SET search_path TO hosp;

-- admissions

ALTER TABLE hosp.admissions DROP CONSTRAINT IF EXISTS admissions_pk CASCADE;
ALTER TABLE hosp.admissions
ADD CONSTRAINT admissions_pk
    PRIMARY KEY (hadm_id);

-- d_icd_diagnoses

ALTER TABLE hosp.d_icd_diagnoses DROP CONSTRAINT IF EXISTS d_icd_diagnoses_pk CASCADE;
ALTER TABLE hosp.d_icd_diagnoses
ADD CONSTRAINT d_icd_diagnoses_pk
    PRIMARY KEY (icd_code, icd_version);

-- d_labitems

ALTER TABLE hosp.d_labitems DROP CONSTRAINT IF EXISTS d_labitems_pk CASCADE;
ALTER TABLE hosp.d_labitems
ADD CONSTRAINT d_labitems_pk
    PRIMARY KEY (itemid);

-- emar

ALTER TABLE hosp.emar DROP CONSTRAINT IF EXISTS emar_pk CASCADE;
ALTER TABLE hosp.emar
ADD CONSTRAINT emar_pk
    PRIMARY KEY (emar_id);

-- labevents

ALTER TABLE hosp.labevents DROP CONSTRAINT IF EXISTS labevents_pk CASCADE;
ALTER TABLE hosp.labevents
ADD CONSTRAINT labevents_pk
    PRIMARY KEY (labevent_id);

-- patients

ALTER TABLE hosp.patients DROP CONSTRAINT IF EXISTS patients_pk CASCADE;
ALTER TABLE hosp.patients
ADD CONSTRAINT patients_pk
    PRIMARY KEY (subject_id);

-- prescriptions

ALTER TABLE hosp.prescriptions DROP CONSTRAINT IF EXISTS prescriptions_pk CASCADE;
ALTER TABLE hosp.prescriptions
ADD CONSTRAINT prescriptions_pk
    PRIMARY KEY (pharmacy_id, drug);

-- icu schema

SET search_path TO icu;

-- d_items

-- icustays

ALTER TABLE icu.icustays DROP CONSTRAINT IF EXISTS icustays_pk CASCADE;
ALTER TABLE icu.icustays
ADD CONSTRAINT icustays_pk
    PRIMARY KEY (stay_id);

-- procedureevents

/* -------------------------------------------------------------------------- */
/*                            Creating Foreign Keys                           */
/* -------------------------------------------------------------------------- */

-- hosp schema

SET search_path TO hosp;

-- admissions

ALTER TABLE hosp.admissions DROP CONSTRAINT IF EXISTS admissions_patients_fk;
ALTER TABLE hosp.admissions
ADD CONSTRAINT admissions_patients_fk
    FOREIGN KEY (subject_id)
    REFERENCES hosp.patients (subject_id);

-- diagnoses_icd

ALTER TABLE hosp.diagnoses_icd DROP CONSTRAINT IF EXISTS diagnoses_icd_patients_fk;
ALTER TABLE hosp.diagnoses_icd
ADD CONSTRAINT diagnoses_icd_patients_fk
    FOREIGN KEY (subject_id)
    REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.diagnoses_icd DROP CONSTRAINT IF EXISTS diagnoses_icd_admissions_fk;
ALTER TABLE hosp.diagnoses_icd
ADD CONSTRAINT diagnoses_icd_admissions_fk
    FOREIGN KEY (hadm_id)
    REFERENCES hosp.admissions (hadm_id);

-- emar

ALTER TABLE hosp.emar DROP CONSTRAINT IF EXISTS emar_patients_fk;
ALTER TABLE hosp.emar
ADD CONSTRAINT emar_patients_fk
    FOREIGN KEY (subject_id)
    REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.emar DROP CONSTRAINT IF EXISTS emar_admissions_fk;
ALTER TABLE hosp.emar
ADD CONSTRAINT emar_admissions_fk
    FOREIGN KEY (hadm_id)
    REFERENCES hosp.admissions (hadm_id);

-- labevents

ALTER TABLE hosp.labevents DROP CONSTRAINT IF EXISTS labevents_patients_fk;
ALTER TABLE hosp.labevents
ADD CONSTRAINT labevents_patients_fk
    FOREIGN KEY (subject_id)
    REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.labevents DROP CONSTRAINT IF EXISTS labevents_d_labitems_fk;
ALTER TABLE hosp.labevents
ADD CONSTRAINT labevents_d_labitems_fk
    FOREIGN KEY (itemid)
    REFERENCES hosp.d_labitems (itemid);

-- prescriptions

ALTER TABLE hosp.prescriptions DROP CONSTRAINT IF EXISTS prescriptions_patients_fk;
ALTER TABLE hosp.prescriptions
ADD CONSTRAINT prescriptions_patients_fk
    FOREIGN KEY (subject_id)
    REFERENCES hosp.patients (subject_id);

ALTER TABLE hosp.prescriptions DROP CONSTRAINT IF EXISTS prescriptions_admissions_fk;
ALTER TABLE hosp.prescriptions
ADD CONSTRAINT prescriptions_admissions_fk
    FOREIGN KEY (hadm_id)
    REFERENCES hosp.admissions (hadm_id);

-- icu shcema

SET search_path TO icu;

-- icustays

ALTER TABLE icu.icustays DROP CONSTRAINT IF EXISTS icustays_patients_fk;
ALTER TABLE icu.icustays
ADD CONSTRAINT icustays_patients_fk
    FOREIGN KEY (subject_id)
    REFERENCES icu.patients (subject_id);

ALTER TABLE icu.icustays DROP CONSTRAINT IF EXISTS icustays_admissions_fk;
ALTER TABLE icu.icustays
ADD CONSTRAINT icustays_admissions_fk
    FOREIGN KEY (hadm_id)
    REFERENCES icu.admissions (hadm_id);

-- procedureevents

ALTER TABLE icu.procedureevents DROP CONSTRAINT IF EXISTS procedureevents_patients_fk;
ALTER TABLE icu.procedureevents
ADD CONSTRAINT procedureevents_patients_fk
    FOREIGN KEY (subject_id)
    REFERENCES icu.patients (subject_id);

ALTER TABLE icu.procedureevents DROP CONSTRAINT IF EXISTS procedureevents_admissions_fk;
ALTER TABLE icu.procedureevents
ADD CONSTRAINT procedureevents_admissions_fk
    FOREIGN KEY (hadm_id)
    REFERENCES icu.admissions (hadm_id);

ALTER TABLE icu.procedureevents DROP CONSTRAINT IF EXISTS procedureevents_icustays_fk;
ALTER TABLE icu.procedureevents
ADD CONSTRAINT procedureevents_icustays_fk
    FOREIGN KEY (stay_id)
    REFERENCES icu.icustays (stay_id);