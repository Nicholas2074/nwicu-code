-- Validate the NWICU tables built correctly by checking against known row counts
-- of NWICU v0.1.0

WITH expected AS
(
    -- hosp schema
    SELECT 'admissions' AS tbl, 61843 AS row_count UNION ALL
    SELECT 'd_icd_diagnoses' AS tbl, 73958 AS row_count UNION ALL
    SELECT 'd_labitems' AS tbl, 256 AS row_count UNION ALL
    SELECT 'diagnoses_icd' AS tbl, 371807 AS row_count UNION ALL
    SELECT 'emar' AS tbl, 19196614 AS row_count UNION ALL
    SELECT 'labevents' AS tbl, 16668451 AS row_count UNION ALL
    SELECT 'patients' AS tbl, 25923 AS row_count UNION ALL
    SELECT 'prescriptions' AS tbl, 1852983 AS row_count UNION ALL
    SELECT 'procedures_icd' AS tbl, 859655 AS row_count UNION ALL
    -- icu schema
    SELECT 'icustays' AS tbl, 28612 AS row_count UNION ALL
    SELECT 'd_items' AS tbl, 344 AS row_count UNION ALL
    SELECT 'chartevents' AS tbl, 9619759 AS row_count UNION ALL
    SELECT 'procedureevents' AS tbl, 1017891 AS row_count
)
, observed as
(
    -- hosp schema
    SELECT 'admissions' AS tbl, count(*) AS row_count FROM nwsci.admissions UNION ALL
    SELECT 'd_icd_diagnoses' AS tbl, count(*) AS row_count FROM nwsci.d_icd_diagnoses UNION ALL
    SELECT 'd_labitems' AS tbl, count(*) AS row_count FROM nwsci.d_labitems UNION ALL
    SELECT 'diagnoses_icd' AS tbl, count(*) AS row_count FROM nwsci.diagnoses_icd UNION ALL
    SELECT 'emar' AS tbl, count(*) AS row_count FROM nwsci.emar UNION ALL
    SELECT 'labevents' AS tbl, count(*) AS row_count FROM nwsci.labevents UNION ALL
    SELECT 'patients' AS tbl, count(*) AS row_count FROM nwsci.patients UNION ALL 
    SELECT 'prescriptions' AS tbl, count(*) AS row_count FROM nwsci.prescriptions UNION ALL
    -- icu schema
    SELECT 'icustays' AS tbl, count(*) AS row_count FROM nwsci.icustays UNION ALL
    SELECT 'chartevents' AS tbl, count(*) AS row_count FROM nwsci.chartevents UNION ALL
    SELECT 'd_items' AS tbl, count(*) AS row_count FROM nwsci.d_items UNION ALL
    SELECT 'procedureevents' AS tbl, count(*) AS row_count FROM nwsci.procedureevents
)
SELECT
    exp.tbl
    , exp.row_count AS expected_count
    , obs.row_count AS observed_count
    , CASE
        WHEN exp.row_count = obs.row_count
        THEN 'PASSED'
        ELSE 'FAILED'
    END AS ROW_COUNT_CHECK
FROM expected exp
INNER JOIN observed obs
  ON exp.tbl = obs.tbl
ORDER BY exp.tbl
;