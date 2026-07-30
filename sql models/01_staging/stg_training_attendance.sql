
-- ============================================================
-- Staging Model: Training Attendance
-- ============================================================
-- Grain: One row per training attendance record.
-- ============================================================

CREATE OR REPLACE VIEW "01_staging".stg_training_attendance AS

SELECT
    number,
    formid,
    training_date,
    training_topic,
    specify_other_training_topic,
    training_venue,
    trainer_name,
    attended_training,
    attendance_status,
    reason_for_partial_attendance,
    case_id,
    completed_time,
    started_time,
    username,
    received_on,
    form_link,
    hq_user,
    training_duration_minutes

FROM dataset_03_transformed.training_attendance_transformed;

-- Quick check
SELECT *
FROM "01_staging".stg_training_attendance
LIMIT 10;
