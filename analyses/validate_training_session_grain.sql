
-- ============================================================
-- Analysis: Validate Training Session Grain
-- ============================================================
-- Purpose:
-- Test whether the combination of training date, training topic,
-- and training venue can identify distinct training sessions.
--
-- The mart is stored at farmer-activity grain, so multiple rows
-- for the same date/topic/venue are expected when several
-- farmers participated in the same training session.
--
-- Each distinct combination below represents a candidate
-- training session, while farmer_records shows the number of
-- farmer-level records associated with that session.
-- ============================================================


SELECT
    activity_date,
    training_topic,
    training_venue,
    COUNT(*) AS farmer_records

FROM "02_marts".mart_programme_performance

WHERE activity_type = 'Training'

GROUP BY
    activity_date,
    training_topic,
    training_venue

ORDER BY
    activity_date,
    training_topic,
    training_venue;
