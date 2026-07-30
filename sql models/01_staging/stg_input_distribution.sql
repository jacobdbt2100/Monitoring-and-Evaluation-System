
-- ============================================================
-- Staging Model: Input Distribution
-- ============================================================
-- Grain: One row per input distribution event.
-- ============================================================

CREATE OR REPLACE VIEW "01_staging".stg_input_distribution AS

SELECT
    number,
    formid,
    distribution_date,
    distribution_location,
    input_type,
    maize_seed_kg,
    rice_seed_kg,
    groundnut_seed_kg,
    fertilizer_kg,
    goats_count,
    rabbits_count,
    recipient_signature,
    case_id,
    completed_time,
    started_time,
    username,
    received_on,
    form_link,
    hq_user,
    distribution_duration_minutes

FROM dataset_03_transformed.input_distribution_transformed;

-- Quick check
SELECT *
FROM "01_staging".stg_input_distribution
LIMIT 10;
