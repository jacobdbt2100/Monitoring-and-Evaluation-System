
-- ============================================================
-- Staging Model: Farmer Registration
-- ============================================================
-- Purpose:
-- Provide a clean staging layer with standardized column names.
--
-- Grain:
-- One row per registered farmer.
-- ============================================================

CREATE OR REPLACE VIEW "01_staging".stg_farmer_registration AS

SELECT
    number,
    formid,
    community,
    first_name,
    last_name,
    gender,
    date_of_birth,
    national_id,
    phone_number,
    farmer_photograph,
    household_size,
    primary_occupation,
    farming_experience_years,
    farm_ownership,
    number_of_farm_plots,
    primary_irrigation_source,
    specify_other_irrigation_source,
    crops_cultivated,
    area_under_groundnuts_hectares,
    area_under_maize_hectares,
    area_under_rice_hectares,
    livestock_kept,
    number_of_goats,
    number_of_rabbits,
    farm_gps_location,
    consent,
    case_id,
    completed_time,
    started_time,
    username,
    received_on,
    form_link,
    hq_user,
    gps_valid,
    farmer_age,
    registration_duration_minutes,
    registration_latitude,
    registration_longitude

FROM dataset_03_transformed.farmer_registration_transformed;

-- Quick check
SELECT *
FROM "01_staging".stg_farmer_registration
LIMIT 10;
