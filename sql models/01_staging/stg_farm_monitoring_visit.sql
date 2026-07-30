
-- ============================================================
-- Staging Model: Farm Monitoring Visit
-- ============================================================
-- Grain: One row per monitoring visit.
-- ============================================================

CREATE OR REPLACE VIEW "01_staging".stg_farm_monitoring_visit AS

SELECT
    number,
    formid,
    visit_date,
    crop_stage,
    crops_observed_during_this_visit,
    crop_condition_maize,
    crop_condition_rice,
    crop_condition_groundnuts,
    livestock_observed_during_this_visit,
    goat_condition,
    rabbit_condition,
    adopted_recommended_farming_practices,
    adopted_practices,
    farm_challenges,
    additional_comments,
    farm_photograph,
    monitoring_visit_gps,
    case_id,
    completed_time,
    started_time,
    username,
    received_on,
    form_link,
    hq_user,
    monitoring_duration_minutes,
    monitoring_latitude,
    monitoring_longitude,
    registration_latitude,
    registration_longitude,
    gps_distance_meters,
    gps_within_expected_range

FROM dataset_03_transformed.farm_monitoring_visit_transformed;

-- Quick check
SELECT *
FROM "01_staging".stg_farm_monitoring_visit
LIMIT 10;
