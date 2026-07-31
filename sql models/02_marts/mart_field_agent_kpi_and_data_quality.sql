
-- ============================================================
-- Mart: Field Agent KPI and Data Quality
-- ============================================================
-- Grain: One row per field agent.
--
-- Purpose: Provide field-agent-level programme performance and
-- data quality measures for Excel report.
--
-- Programme KPI measures:
-- • Farmers trained
-- • Farmers receiving inputs
-- • Farmers monitored
-- • Farmers with recorded adoption
--
-- Data quality measures:
-- • Average GPS distance from registration location (m)
-- • GPS records outside the expected range
-- • Average monitoring form completion time (minutes)
--
-- The field-agent grain makes it possible to compare agents
-- and identify records requiring further investigation.
-- ============================================================

DROP TABLE IF EXISTS "02_marts".mart_field_agent_kpi_and_data_quality;

CREATE TABLE "02_marts".mart_field_agent_kpi_and_data_quality AS

SELECT
    f.username AS field_agent,

    -- ========================================================
    -- Programme KPI measures
    -- ========================================================

    -- Number of unique farmers registered by the field agent.
    COUNT(DISTINCT f.case_id) AS registered_farmers,

    -- Number of unique farmers recorded as having attended
    -- at least one training.
    COUNT(DISTINCT t.case_id) AS farmers_trained,

    -- Number of unique farmers who received at least one input.
    COUNT(DISTINCT i.case_id) AS farmers_receiving_inputs,

    -- Number of unique farmers with at least one monitoring visit.
    COUNT(DISTINCT m.case_id) AS farmers_monitored,
	
	-- Number of monitoring visits completed by the field agent.
	COUNT(m.case_id) AS monitoring_visits,

    -- Number of unique farmers with adoption recorded as "yes"
    -- during at least one monitoring visit.
    COUNT(DISTINCT CASE
        WHEN m.adoption_recorded = TRUE THEN m.case_id
    END) AS farmers_with_adoption,

    -- ========================================================
    -- Data quality: GPS
    -- ========================================================

    -- Average GPS distance between the monitoring visit location
    -- and the farmer's registered location.
    ROUND(
        AVG(m.gps_distance_meters)::NUMERIC,
        2
    ) AS average_gps_distance_from_registration_m,

    -- Number of monitoring records whose GPS distance exceeds
    -- the expected range established during data transformation.
    COUNT(
        CASE
            WHEN m.gps_within_expected_range = FALSE THEN 1
        END
    ) AS gps_outside_expected_range,

    -- ========================================================
    -- Data quality: Form completion time
    -- ========================================================

    -- Average time taken to complete monitoring visit forms.
    -- Values notably higher or lower than the overall average
    -- can be reviewed for possible data-quality issues.
    ROUND(
        AVG(m.monitoring_duration_minutes)::NUMERIC,
        2
    ) AS average_monitoring_form_completion_minutes

FROM "01_staging".stg_farmer_registration f

-- ============================================================
-- Training participation
-- ============================================================
-- Keep only farmers recorded as having attended at least one
-- training. DISTINCT prevents multiple training records from
-- duplicating the farmer during aggregation.
LEFT JOIN (
    SELECT DISTINCT case_id
    FROM "01_staging".stg_training_attendance
    WHERE attended_training = TRUE
) t
    ON f.case_id = t.case_id

-- ============================================================
-- Input distribution
-- ============================================================
-- DISTINCT ensures that multiple input distribution records
-- for the same farmer are counted once.
LEFT JOIN (
    SELECT DISTINCT case_id
    FROM "01_staging".stg_input_distribution
) i
    ON f.case_id = i.case_id

-- ============================================================
-- Farm monitoring and data quality
-- ============================================================
-- Monitoring visits are retained at record level here so that
-- GPS distance and completion-time measures can be aggregated
-- for each field agent.
LEFT JOIN (
    SELECT
        case_id,

        -- A farmer is considered to have recorded adoption if
        -- "yes" occurred during at least one monitoring visit.
        BOOL_OR(
            adopted_recommended_farming_practices = 'yes'
        ) AS adoption_recorded,

        gps_distance_meters,
        gps_within_expected_range,
        monitoring_duration_minutes

    FROM "01_staging".stg_farm_monitoring_visit
    GROUP BY
        case_id,
        gps_distance_meters,
        gps_within_expected_range,
        monitoring_duration_minutes
) m
    ON f.case_id = m.case_id

GROUP BY
    f.username;


-- ============================================================
-- Quick check
-- ============================================================
-- Confirm the mart was created at field-agent grain.
-- ============================================================

SELECT *
FROM "02_marts".mart_field_agent_kpi_and_data_quality;
