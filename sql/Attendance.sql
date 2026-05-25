SELECT
    stadium,
    COUNT(*) AS matches_played,
    AVG(
        CASE
            WHEN TRIM(attendance) ILIKE 'nan' THEN NULL
            ELSE REPLACE(TRIM(attendance), ',', '')::INT
        END
    ) AS avg_attendance,
    MAX(
        CASE
            WHEN TRIM(attendance) ILIKE 'nan' THEN NULL
            ELSE REPLACE(TRIM(attendance), ',', '')::INT
        END
    ) AS highest_attendance
FROM premierleaguedashboard
GROUP BY stadium
ORDER BY avg_attendance DESC;