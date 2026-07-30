
CREATE TABLE dataset_03_transformed.training_attendance_transformed (
    number                                                                  INTEGER,
    formid                                                                  TEXT,
    training_date                                                           DATE,
    training_topic                                                          TEXT,
    specify_other_training_topic                                            TEXT,
    training_venue                                                          TEXT,
    trainer_name                                                            TEXT,
    attended_training                                                       BOOLEAN,
    attendance_status                                                       TEXT,
    reason_for_partial_attendance                                           TEXT,
    case_id                                                                 TEXT,
    completed_time                                                          TIMESTAMP,
    started_time                                                            TIMESTAMP,
    username                                                                TEXT,
    received_on                                                             TIMESTAMP,
    form_link                                                               TEXT,
    hq_user                                                                 TEXT,
    training_duration_minutes                                               NUMERIC(10,2)
);

-- ============================================================
-- Indexes
-- ============================================================
-- Create indexes only on columns that are frequently used
-- for joins or aggregations to improve query performance.
-- ============================================================

-- Used to join training attendance with farmer registration
CREATE INDEX idx_training_attendance_case_id
ON dataset_03_transformed.training_attendance_transformed (case_id);

-- Used to calculate field agent performance metrics
CREATE INDEX idx_training_attendance_username
ON dataset_03_transformed.training_attendance_transformed (username);

-- ============================================================
-- Preview
-- ============================================================

SELECT *
FROM dataset_03_transformed.training_attendance_transformed;
