SELECT
    "Home Team" AS team,
    SUM(home_shots) AS total_home_shots,
    SUM(home_on) AS shots_on_target,
    SUM(home_chances) AS chances_created,
    SUM(home_corners) AS corners
FROM premierleaguedashboard
GROUP BY "Home Team"
ORDER BY total_home_shots DESC;