
CREATE TABLE dataset_03_transformed.farm_monitoring_visit_transformed (
    number                                                                  INTEGER,
    formid                                                                  TEXT,
    visit_date                                                              DATE,
    crop_stage                                                              TEXT,
    crops_observed_during_this_visit                                        TEXT,
    crop_condition_maize                                                    TEXT,
    crop_condition_rice                                                     TEXT,
    crop_condition_groundnuts                                               TEXT,
    livestock_observed_during_this_visit                                    TEXT,
    goat_condition                                                          TEXT,
    rabbit_condition                                                        TEXT,
    adopted_recommended_farming_practices                                   TEXT,
    adopted_practices                                                       TEXT,
    farm_challenges                                                         TEXT,
    additional_comments                                                     TEXT,
    farm_photograph                                                         TEXT,
    monitoring_visit_gps                                                    TEXT,
    case_id                                                                 TEXT,
    completed_time                                                          TIMESTAMP,
    started_time                                                            TIMESTAMP,
    username                                                                TEXT,
    received_on                                                             TIMESTAMP,
    form_link                                                               TEXT,
    hq_user                                                                 TEXT,
    monitoring_duration_minutes                                             NUMERIC(10,2),
    monitoring_latitude                                                     NUMERIC(10,7),
    monitoring_longitude                                                    NUMERIC(10,7),
    registration_latitude                                                   NUMERIC(10,7),
    registration_longitude                                                  NUMERIC(10,7),
    gps_distance_meters                                                     NUMERIC(10,2),
    gps_within_expected_range                                               BOOLEAN
);

-- ============================================================
-- Indexes
-- ============================================================
-- Create indexes only on columns that are frequently used
-- for joins or aggregations to improve query performance.
-- ============================================================

-- Used to join monitoring visits with farmer registration
CREATE INDEX idx_farm_monitoring_case_id
ON dataset_03_transformed.farm_monitoring_visit_transformed (case_id);

-- Used to calculate field agent performance metrics
CREATE INDEX idx_farm_monitoring_username
ON dataset_03_transformed.farm_monitoring_visit_transformed (username);

-- ============================================================
-- Preview
-- ============================================================

SELECT *
FROM dataset_03_transformed.farm_monitoring_visit_transformed;
