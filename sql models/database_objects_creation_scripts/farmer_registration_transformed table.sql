
CREATE TABLE dataset_03_transformed.farmer_registration_transformed (
    number                                                                  INTEGER,
    formid                                                                  TEXT,
    community                                                               TEXT,
    first_name                                                              TEXT,
    last_name                                                               TEXT,
    gender                                                                  TEXT,
    date_of_birth                                                           DATE,
    national_id                                                             TEXT,
    phone_number                                                            TEXT,
    farmer_photograph                                                       TEXT,
    household_size                                                          INTEGER,
    primary_occupation                                                      TEXT,
    farming_experience_years                                                INTEGER,
    farm_ownership                                                          TEXT,
    number_of_farm_plots                                                    INTEGER,
    primary_irrigation_source                                               TEXT,
    specify_other_irrigation_source                                         TEXT,
    crops_cultivated                                                        TEXT,
    area_under_groundnuts_hectares                                          NUMERIC(10,2),
    area_under_maize_hectares                                               NUMERIC(10,2),
    area_under_rice_hectares                                                NUMERIC(10,2),
    livestock_kept                                                          TEXT,
    number_of_goats                                                         INTEGER,
    number_of_rabbits                                                       INTEGER,
    farm_gps_location                                                       TEXT,
    consent                                                                 BOOLEAN,
    case_id                                                                 TEXT,
    completed_time                                                          TIMESTAMP,
    started_time                                                            TIMESTAMP,
    username                                                                TEXT,
    received_on                                                             TIMESTAMP,
    form_link                                                               TEXT,
    hq_user                                                                 TEXT,
    gps_valid                                                               BOOLEAN,
    farmer_age                                                              INTEGER,
    registration_duration_minutes                                           NUMERIC(10,2),
    registration_latitude                                                   NUMERIC(10,7),
    registration_longitude                                                  NUMERIC(10,7)
);

-- ============================================================
-- Indexes
-- ============================================================
-- Create indexes only on columns that are frequently used
-- for joins or aggregations to improve query performance.
-- ============================================================

-- Used to join all programme datasets
CREATE INDEX idx_farmer_registration_case_id
ON dataset_03_transformed.farmer_registration_transformed (case_id);

-- Used to calculate field agent performance metrics
CREATE INDEX idx_farmer_registration_username
ON dataset_03_transformed.farmer_registration_transformed (username);

-- ============================================================
-- Preview
-- ============================================================

SELECT *
FROM dataset_03_transformed.farmer_registration_transformed;
