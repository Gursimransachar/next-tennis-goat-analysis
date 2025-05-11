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

filtered_players as (

	select * from nextgoat1 where (
	player_1 in (select winner from player_birth_dates)
	and player_2 in (select winner from player_birth_dates)) 

),

head_2_head as (

	select 
	case when player_1 < player_2 then player_1 else player_2 end as player_a,
	case when player_1 < player_2 then player_2 else player_1 end as player_b,
	case 
      when player_1 < player_2 and winner = player_1 then 1
      when player_2 < player_1 and winner = player_2 then 1
      else 0
    end as win_a,
    case 
      when player_1 < player_2 and winner = player_2 then 1
      when player_2 < player_1 and winner = player_1 then 1
      ELSE 0
    END AS win_b
	from filtered_players

)

select player_a, player_b, 
sum(win_a) as player_a_over_player_b, 
sum(win_b) as player_b_over_player_a, 
sum(win_a + win_b) as total_matches,
round((sum(win_a) * 100.0) / NULLIF(sum(win_a + win_b), 0),2) AS win_pct_a,
round((sum(win_b) * 100.0) / NULLIF(sum(win_a + win_b), 0),2) AS win_pct_b
from head_2_head
group by player_a, player_b
order by total_matches desc