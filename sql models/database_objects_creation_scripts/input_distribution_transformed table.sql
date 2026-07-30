
CREATE TABLE dataset_03_transformed.input_distribution_transformed (
    number                                                                  INTEGER,
    formid                                                                  TEXT,
    distribution_date                                                       DATE,
    distribution_location                                                   TEXT,
    input_type                                                              TEXT,
    maize_seed_kg                                                           NUMERIC(10,2),
    rice_seed_kg                                                            NUMERIC(10,2),
    groundnut_seed_kg                                                       NUMERIC(10,2),
    fertilizer_kg                                                           NUMERIC(10,2),
    goats_count                                                             INTEGER,
    rabbits_count                                                           INTEGER,
    recipient_signature                                                     TEXT,
    case_id                                                                 TEXT,
    completed_time                                                          TIMESTAMP,
    started_time                                                            TIMESTAMP,
    username                                                                TEXT,
    received_on                                                             TIMESTAMP,
    form_link                                                               TEXT,
    hq_user                                                                 TEXT,
    distribution_duration_minutes                                           NUMERIC(10,2)
);

-- ============================================================
-- Indexes
-- ============================================================
-- Create indexes only on columns that are frequently used
-- for joins or aggregations to improve query performance.
-- ============================================================

-- Used to join input distribution with farmer registration
CREATE INDEX idx_input_distribution_case_id
ON dataset_03_transformed.input_distribution_transformed (case_id);

-- Used to calculate field agent performance metrics
CREATE INDEX idx_input_distribution_username
ON dataset_03_transformed.input_distribution_transformed (username);

-- ============================================================
-- Preview
-- ============================================================

SELECT *
FROM dataset_03_transformed.input_distribution_transformed;
