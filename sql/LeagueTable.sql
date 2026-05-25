WITH results AS (
    SELECT
        "Home Team" AS team,
        CASE
            WHEN "Goals Home" > "Away Goals" THEN 3
            WHEN "Goals Home" = "Away Goals" THEN 1
            ELSE 0
        END AS points
    FROM premierleaguedashboard

    UNION ALL

    SELECT
        "Away Team" AS team,
        CASE
            WHEN "Away Goals" > "Goals Home" THEN 3
            WHEN "Away Goals" = "Goals Home" THEN 1
            ELSE 0
        END AS points
    FROM premierleaguedashboard
)

SELECT
    team,
    SUM(points) AS total_points
FROM results
GROUP BY team
ORDER BY total_points DESC;