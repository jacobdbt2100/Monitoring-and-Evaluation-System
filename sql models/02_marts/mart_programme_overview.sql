
-- ============================================================
-- Mart: Programme Overview
-- ============================================================
-- Grain: One row per farmer.

-- Purpose: Provide farmer profile, farming profile, programme
-- participation, and adoption information for the Programme Overview report.
-- ============================================================

DROP TABLE IF EXISTS "02_marts".mart_programme_overview;

CREATE TABLE "02_marts".mart_programme_overview AS

SELECT
    -- Farmer profile
    f.case_id,
    f.community,
    f.gender,
    f.farmer_age,
    f.primary_occupation,
    f.farming_experience_years,
    f.household_size,

    -- Farming profile
    f.crops_cultivated,
    f.area_under_maize_hectares,
    f.area_under_rice_hectares,
    f.area_under_groundnuts_hectares,
    f.livestock_kept,
    f.number_of_goats,
    f.number_of_rabbits,

    -- Programme participation indicators
    CASE
        WHEN t.case_id IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS training_participation_indicator,

    CASE
        WHEN i.case_id IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS input_recipient_indicator,

    CASE
        WHEN m.case_id IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS monitoring_participation_indicator,

    -- Adoption indicator: TRUE if adoption was recorded
    -- during at least one monitoring visit.
    m.adoption_indicator

FROM "01_staging".stg_farmer_registration f

-- Keep only farmers recorded as having attended at least one training.
-- The attendance Yes/No question makes this filter necessary.
-- DISTINCT prevents multiple training records from duplicating farmers.
LEFT JOIN (
    SELECT DISTINCT case_id
    FROM "01_staging".stg_training_attendance
    WHERE attended_training = TRUE
) t
    ON f.case_id = t.case_id

-- Identify farmers who received at least one input.
-- DISTINCT prevents multiple distribution records from duplicating farmers.
LEFT JOIN (
    SELECT DISTINCT case_id
    FROM "01_staging".stg_input_distribution
) i
    ON f.case_id = i.case_id

-- Summarize multiple monitoring visits to one farmer-level indicator.
-- TRUE means adoption was recorded during at least one visit.
LEFT JOIN (
    SELECT
        case_id,
        BOOL_OR(adopted_recommended_farming_practices = 'yes')
            AS adoption_indicator
    FROM "01_staging".stg_farm_monitoring_visit
    GROUP BY case_id
) m
    ON f.case_id = m.case_id;


-- ============================================================
-- Quick check
-- ============================================================

SELECT *
FROM "02_marts".mart_programme_overview
LIMIT 10;
