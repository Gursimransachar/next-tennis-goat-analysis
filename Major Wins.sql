WITH player_birth_dates AS (
  -- Big 3
  SELECT 'Djokovic N.' AS winner, DATE '1987-05-22' AS birth_date, 'Big 3' AS generation UNION
  SELECT 'Nadal R.', DATE '1986-06-03', 'Big 3' UNION
  SELECT 'Federer R.', DATE '1981-08-08', 'Big 3' UNION
  
  -- Next Gen
  SELECT 'Alcaraz C.', DATE '2003-05-05', 'Next Gen' UNION
  SELECT 'Sinner J.', DATE '2001-08-16', 'Next Gen' UNION
  SELECT 'Medvedev D.', DATE '1996-02-11', 'Next Gen' UNION
  SELECT 'Zverev A.', DATE '1997-04-20', 'Next Gen' UNION
  SELECT 'Tsitsipas S.', DATE '1998-08-12', 'Next Gen' UNION
  SELECT 'Hurkacz H.', DATE '1997-02-11', 'Next Gen' UNION
  SELECT 'Rublev A.', DATE '1997-10-20', 'Next Gen' UNION
  SELECT 'Draper J.', DATE '2001-12-22', 'Next Gen' UNION
  SELECT 'Mensik J.', DATE '2005-09-26', 'Next Gen' UNION
  SELECT 'Popyrin A.', DATE '1999-08-05', 'Next Gen' UNION
  SELECT 'Rune H.', DATE '2003-04-29', 'Next Gen' UNION
  SELECT 'Thiem D.', DATE '1993-09-03', 'Next Gen'
),
matches_with_age AS (
  SELECT 
    n.winner,
    p.generation,
    EXTRACT(YEAR FROM n.date) - EXTRACT(YEAR FROM p.birth_date)
      - CASE 
          WHEN EXTRACT(MONTH FROM n.date) < EXTRACT(MONTH FROM p.birth_date)
            OR (EXTRACT(MONTH FROM n.date) = EXTRACT(MONTH FROM p.birth_date) AND EXTRACT(DAY FROM n.date) < EXTRACT(DAY FROM p.birth_date))
          THEN 1 ELSE 0
        END AS age
  FROM nextgoat1 n
  JOIN player_birth_dates p ON n.winner = p.winner
  WHERE n.series IN ('Grand Slam', 'Masters 1000', 'Masters Cup')
    AND n.round = 'The Final'
    AND EXTRACT(YEAR FROM n.date) BETWEEN 2003 AND 2025
),
filtered_matches AS (
  SELECT winner, generation, age, COUNT(*) AS titles
  FROM matches_with_age
  WHERE age BETWEEN 19 AND 24
  GROUP BY winner, generation, age
),
with_cumulative AS (
  SELECT 
    winner,
    generation,
    age,
    titles,
    SUM(titles) OVER (PARTITION BY winner ORDER BY age) AS cumulative_titles
  FROM filtered_matches
)

SELECT * FROM with_cumulative
ORDER BY generation, winner, age;

