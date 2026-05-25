WITH team_results AS (
    SELECT
        "Home Team" AS team,
        1 AS played,
        CASE WHEN "Goals Home" > "Away Goals" THEN 1 ELSE 0 END AS wins,
        CASE WHEN "Goals Home" = "Away Goals" THEN 1 ELSE 0 END AS draws,
        CASE WHEN "Goals Home" < "Away Goals" THEN 1 ELSE 0 END AS losses,
        "Goals Home" AS goals_for,
        "Away Goals" AS goals_against,
        CASE
            WHEN "Goals Home" > "Away Goals" THEN 3
            WHEN "Goals Home" = "Away Goals" THEN 1
            ELSE 0
        END AS points
    FROM premierleaguedashboard

    UNION ALL

    SELECT
        "Away Team" AS team,
        1 AS played,
        CASE WHEN "Away Goals" > "Goals Home" THEN 1 ELSE 0 END AS wins,
        CASE WHEN "Away Goals" = "Goals Home" THEN 1 ELSE 0 END AS draws,
        CASE WHEN "Away Goals" < "Goals Home" THEN 1 ELSE 0 END AS losses,
        "Away Goals" AS goals_for,
        "Goals Home" AS goals_against,
        CASE
            WHEN "Away Goals" > "Goals Home" THEN 3
            WHEN "Away Goals" = "Goals Home" THEN 1
            ELSE 0
        END AS points
    FROM premierleaguedashboard
)

SELECT
    team,
    SUM(played) AS played,
    SUM(wins) AS wins,
    SUM(draws) AS draws,
    SUM(losses) AS losses,
    SUM(goals_for) AS goals_for,
    SUM(goals_against) AS goals_against,
    SUM(goals_for) - SUM(goals_against) AS goal_difference,
    SUM(points) AS points
FROM team_results
GROUP BY team
ORDER BY points DESC, goal_difference DESC, goals_for DESC;