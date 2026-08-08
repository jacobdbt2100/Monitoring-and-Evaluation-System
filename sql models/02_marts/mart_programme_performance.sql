
-- ============================================================
-- Mart: Programme Performance
-- ============================================================
-- Grain: One row per programme activity record.
--
-- Purpose: Provide activity-level data for the Programme
-- Performance report.
--
-- The three activity types are kept at their original grains
-- and stacked using UNION ALL rather than joined together.
-- This prevents multiple records from different activities
-- from multiplying each other.
-- ============================================================

DROP TABLE IF EXISTS "02_marts".mart_programme_performance;

CREATE TABLE "02_marts".mart_programme_performance AS

-- ============================================================
-- Training activity
-- ============================================================
-- One row represents one farmer's training attendance record.
--
-- Supports the Programme Performance report:
-- • Training Topics
-- • Attendance Status
-- ============================================================

SELECT
    'Training' AS activity_type,
    t.case_id,
    t.training_date AS activity_date,
    t.username AS field_agent,

    -- Training information
    t.training_topic,
    t.training_venue,
    t.attendance_status,

    -- Not applicable to training records.
    -- NULLs keep the same column structure required by UNION ALL.
    NULL::TEXT AS input_type,

    -- Not applicable to training records.
    -- Input quantities are populated only for input distribution records.
    NULL::NUMERIC AS maize_seed_kg,
    NULL::NUMERIC AS rice_seed_kg,
    NULL::NUMERIC AS groundnut_seed_kg,
    NULL::NUMERIC AS fertilizer_kg,
    NULL::NUMERIC AS goats_count,
    NULL::NUMERIC AS rabbits_count,

    -- Not applicable to training records.
    -- These fields support crop-condition analysis from monitoring visits.
    NULL::TEXT AS crop_stage,
    NULL::TEXT AS crop_condition_maize,
    NULL::TEXT AS crop_condition_rice,
    NULL::TEXT AS crop_condition_groundnuts,

    -- Not applicable to training records.
    -- These fields support livestock-condition analysis from monitoring visits.
    NULL::TEXT AS goat_condition,
    NULL::TEXT AS rabbit_condition,

    -- Not applicable to training records.
    NULL::TEXT AS adopted_recommended_farming_practices

FROM "01_staging".stg_training_attendance t


UNION ALL


-- ============================================================
-- Input distribution activity
-- ============================================================
-- One row represents one input distribution record.
--
-- Supports the Programme Performance report:
-- • Input Distribution by Type
-- ============================================================

SELECT
    'Input Distribution' AS activity_type,
    i.case_id,
    i.distribution_date AS activity_date,
    i.username AS field_agent,

    -- Not applicable to input distribution records.
    NULL::TEXT AS training_topic,
    NULL::TEXT AS training_venue,
    NULL::TEXT AS attendance_status,

    -- Input information
    i.input_type,

    -- Input quantities
    i.maize_seed_kg,
    i.rice_seed_kg,
    i.groundnut_seed_kg,
    i.fertilizer_kg,
    i.goats_count,
    i.rabbits_count,

    -- Not applicable to input distribution records.
    -- These fields support crop-condition analysis from monitoring visits.
    NULL::TEXT AS crop_stage,
    NULL::TEXT AS crop_condition_maize,
    NULL::TEXT AS crop_condition_rice,
    NULL::TEXT AS crop_condition_groundnuts,

    -- Not applicable to input distribution records.
    -- These fields support livestock-condition analysis from monitoring visits.
    NULL::TEXT AS goat_condition,
    NULL::TEXT AS rabbit_condition,

    -- Not applicable to input distribution records.
    NULL::TEXT AS adopted_recommended_farming_practices

FROM "01_staging".stg_input_distribution i


UNION ALL


-- ============================================================
-- Farm monitoring activity
-- ============================================================
-- One row represents one farm monitoring visit.
--
-- Supports the Programme Performance report:
-- • Adoption of Recommended Practices
-- • Crop Condition
-- • Livestock Condition
-- ============================================================

SELECT
    'Farm Monitoring' AS activity_type,
    m.case_id,
    m.visit_date AS activity_date,
    m.username AS field_agent,

    -- Not applicable to farm monitoring records.
    NULL::TEXT AS training_topic,
    NULL::TEXT AS training_venue,
    NULL::TEXT AS attendance_status,

    -- Not applicable to farm monitoring records.
    NULL::TEXT AS input_type,

    -- Not applicable to farm monitoring records.
    -- Input quantities are populated only for input distribution records.
    NULL::NUMERIC AS maize_seed_kg,
    NULL::NUMERIC AS rice_seed_kg,
    NULL::NUMERIC AS groundnut_seed_kg,
    NULL::NUMERIC AS fertilizer_kg,
    NULL::NUMERIC AS goats_count,
    NULL::NUMERIC AS rabbits_count,

    -- Crop monitoring information
    m.crop_stage,
    m.crop_condition_maize,
    m.crop_condition_rice,
    m.crop_condition_groundnuts,

    -- Livestock monitoring information
    m.goat_condition,
    m.rabbit_condition,

    -- Adoption information
    -- Retained at visit level because a farmer can have
    -- multiple monitoring visits with different observations.
    m.adopted_recommended_farming_practices

FROM "01_staging".stg_farm_monitoring_visit m;


-- ============================================================
-- Quick check
-- ============================================================
-- Confirm that the mart was created and inspect the
-- combined activity-level records.
-- ============================================================

SELECT *
FROM "02_marts".mart_programme_performance
LIMIT 20;
