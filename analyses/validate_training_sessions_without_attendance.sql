
-- ============================================================
-- Analysis: Validate Training Sessions Without Attendance
-- ============================================================
-- Purpose:
-- Identify training sessions where no farmer has a recorded
-- full or partial attendance.
--
-- A training session is identified by the combination of
-- activity date, training topic, and training venue.
--
-- This analysis was created to investigate the relationship
-- between Training Sessions Conducted and Training Attendance
-- Records in the synthetic dataset.
--
-- The result also helps identify sessions with zero recorded
-- attendees that may require attention when the synthetic data
-- generation logic is revised.
-- ============================================================

SELECT
    activity_date,
    training_topic,
    training_venue,

    -- Number of farmer-level records associated with the session.
    COUNT(*) AS farmer_records,

    -- Count only farmers recorded as having attended fully
    -- or partially. A result of zero means no recorded attendee.
    COUNT(*) FILTER (
        WHERE attendance_status IN (
            'full_attendance',
            'partial_attendance'
        )
    ) AS attending_farmers

FROM "02_marts".mart_programme_performance

WHERE activity_type = 'Training'

GROUP BY
    activity_date,
    training_topic,
    training_venue

-- Return only sessions with no recorded attendees.
HAVING COUNT(*) FILTER (
    WHERE attendance_status IN (
        'full_attendance',
        'partial_attendance'
    )
) = 0

ORDER BY
    activity_date;
