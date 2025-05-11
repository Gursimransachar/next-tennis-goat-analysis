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

join_table as (
SELECT 
    n.winner, p.generation, n.player_1, n.player_2, n.surface
  FROM nextgoat1 n
  JOIN player_birth_dates p ON n.player_1 = p.winner OR n.player_2 = p.winner
),

all_matches AS (
  SELECT surface, generation,
    Player_1 AS player,
    CASE WHEN Player_1 = Winner THEN 1 ELSE 0 END AS win
  FROM join_table
  UNION ALL
  SELECT surface, generation,
    Player_2 AS player,
    CASE WHEN Player_2 = Winner THEN 1 ELSE 0 END AS win
  FROM join_table
  
)
SELECT 
  player, surface, generation,
  COUNT(*) AS total_matches_played,
  SUM(win) AS total_wins,
  ROUND(100.0 * SUM(win) / COUNT(*), 2) AS win_percentage
FROM all_matches
WHERE player IN (
  'Djokovic N.', 'Nadal R.', 'Federer R.',
  'Alcaraz C.', 'Sinner J.', 'Medvedev D.',
  'Zverev A.', 'Tsitsipas S.', 'Hurkacz H.',
  'Rublev A.', 'Draper J.', 'Mensik J.',
  'Popyrin A.', 'Rune H.', 'Thiem D.'
)
GROUP BY player, surface, generation
ORDER BY win_percentage DESC;

