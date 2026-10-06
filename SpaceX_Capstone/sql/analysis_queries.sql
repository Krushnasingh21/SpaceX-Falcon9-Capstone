-- Run against the launches table created by notebook 04 (SQLite).
SELECT launchpad_name, COUNT(*) AS launch_count
FROM launches
GROUP BY launchpad_name
ORDER BY launch_count DESC;

SELECT year, COUNT(*) AS launch_count
FROM launches
WHERE year IS NOT NULL
GROUP BY year
ORDER BY year;

SELECT launchpad_name,
       COUNT(success) AS known_outcomes,
       ROUND(100.0 * SUM(CASE WHEN success = 1 THEN 1 ELSE 0 END) /
             NULLIF(COUNT(success), 0), 2) AS success_rate_pct
FROM launches
GROUP BY launchpad_name
ORDER BY success_rate_pct DESC;
