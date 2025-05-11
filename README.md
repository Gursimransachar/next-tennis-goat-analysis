# next-tennis-goat-analysis

Who's the Next Tennis GOAT? — A Data-Driven Comparison of the Big 3 vs. Next Gen

**Author:** Gursimran Sachar
**Last Updated:** May 2025

Welcome to this data-driven project inspired by the eternal debate in men's tennis — who is the next Greatest of All Time (GOAT)? While Roger Federer, Rafael Nadal, and Novak Djokovic have defined the last two decades, this project explores whether the current crop of players like Carlos Alcaraz, Jannik Sinner, Holger Rune, and others are on a similar trajectory.

Objective
This project explores the ongoing debate in the tennis world: who could be the 'Next GOAT' after the era of Roger Federer, Rafael Nadal, and Novak Djokovic — the Big 3. Leveraging ATP match data from 2000 to 2025, the early performance of emerging stars such as Carlos Alcaraz and Jannik Sinner was analyzed, focusing on comparable metrics such as title wins, win percentages, Top 10 victories, surface specialization, and head-to-head records. The goal is to determine if the 'Next Gen' is on track to match or surpass the dominance of the Big 3. This is a very basic starting point to explore this ambitious question, with room to scale the model further.
Methodology
A dataset of ATP matches from 2020–2025 was used. The analysis was performed using SQL for data filtering, Python for preprocessing, and Tableau for visual analytics.

Steps:
1. Filtered players who reached or won finals in Grand Slams, Masters 1000, and ATP Finals (2020–2025).
2. Removed Djokovic to isolate new generation competitors.
3. Added manually collected birthdates to compute player age in each match.
4. Identified players aged 18–24 with at least one major title.
5. Compared early careers of Next Gen vs Big 3 using:
   - Top 10 wins (age 18–24)
   - Overall win percentage
   - Surface-specific win percentage
   - Head-to-head matchups

Data Sources
- ATP match-level dataset (2000–2025)
- Manually entered player birthdates
- Public rankings and match archives from ATP Tour

Section 1: Identifying the Next Gen
Worksheets: Final Wins (2020–2025), Next Gen Players Aged 18–24 with Titles
- Identified winners of top-tier tournaments (Grand Slams, Masters 1000, ATP Finals) from 2020–2025.
- Excluded Djokovic to focus on fresh challengers.
- Used known birth years to filter players aged 18–24 and analyze early success.
Major Titles (2020–2025) — Next Gen Titles
This section highlights players aged 18–24 who reached or won finals in elite tournaments. Carlos Alcaraz and Jannik Sinner emerged as the most successful players in this age bracket. Alcaraz has won multiple Grand Slams by age 22, making him the most promising candidate.

 <img width="472" alt="image" src="https://github.com/user-attachments/assets/0959017d-59e5-486b-ac9d-d9d9a4aac50e" />


Section 2: Top 10 Wins and Early Career Comparison
Worksheets: Top 10 Wins Comparison (Age 18–24), Overall Win Percentage Comparison
- Compared Top 10 opponent victories for Big 3 vs. Next Gen (when aged 19–24).
- Calculated and visualized overall win percentages across both groups.
  
Top 10 Wins (Age 19–24)
The number of wins against Top 10 opponents for both Big 3 and Next Gen players when aged between 18 and 24 was tracked. The Big 3 outperformed consistently in this category, but Alcaraz and Sinner are showing competitive numbers. This metric helps understand a player's ability to challenge elite opponents early in their career.

<img width="488" alt="image" src="https://github.com/user-attachments/assets/4ff3d3be-992a-48df-9ffa-4b58baa537c5" />

Insights: Players like Alcaraz, Sinner, Rune have already won major titles at a young age. These players are clear standouts in the post-Big 3 era.


Overall Win Percentage
Next Gen players show a mixed performance in win percentage. While the Big 3 had a career win rate of over 85% in this age range, only Alcaraz and Sinner crossed the 75% mark. This suggests that while talent exists, consistency is still developing.

<img width="485" alt="image" src="https://github.com/user-attachments/assets/1a615a2d-63e3-4067-bd59-35597486e428" />


<img width="456" alt="image" src="https://github.com/user-attachments/assets/78ca49c3-2d56-4fb3-93c3-ee30b292b3e3" />

<img width="486" alt="image" src="https://github.com/user-attachments/assets/61e8376b-fa00-4b3f-a4a8-99ac3f5f2d23" />

 

Section 3: Surface Analysis and Head-to-Head Results
Worksheets: Win Percentage by Surface, Head-to-Head Heatmap (Next Gen vs. Big 3)
- Disaggregated win percentage by surface (clay, grass, hard).
- Created a head-to-head matrix showing matchups between Next Gen and Big 3 players.
  
Surface-Based Win Analysis
The Big 3 have historically dominated specific surfaces (e.g., Nadal on clay, Federer on grass). In contrast, the Next Gen show more balance across surfaces. This can either be seen as versatility or a lack of surface specialization. Alcaraz is beginning to mirror Nadal's clay success, while Sinner shows promise on hard courts.

<img width="448" alt="image" src="https://github.com/user-attachments/assets/00308e71-1f06-4c38-989e-99e723d54582" />
 

Insights: Big 3 had more consistent and frequent wins vs. Top 10 opponents in early years. Alcaraz and Sinner stand out with comparable Top 10-win rates in the same age window. Win percentage analysis shows Next Gen is competitive but slightly more volatile.

Head-to-Head with Big 3
A heatmap comparing win-loss records between Big 3 and Next Gen was plotted. As expected, the Big 3 dominate most matchups, but a shift is visible. Alcaraz has a winning record against Djokovic in some contexts, and Sinner has beaten both Nadal and Djokovic in key matches.
 
Insights: The Big 3 show surface dominance, especially Nadal on clay and Djokovic on hard. Next Gen players show more balanced performance across surfaces but not clear dominance. Alcaraz and Sinner are among the few with head-to-head wins against Big 3 members.
Key Takeaways from the Project
- Alcaraz and Sinner are closest in matching Big 3 early career trajectories.
- The Top 10-win comparison highlights how dominant the Big 3 were even as young players.
- Surface-wise, the Big 3 have stronger specialization, while Next Gen players are more generalists.
- Head-to-head data shows the Big 3 still maintain an edge, though cracks are visible — especially with Nadal and Federer aging out of the top tier.

<img width="467" alt="image" src="https://github.com/user-attachments/assets/67a36b66-3a6f-4d43-adac-c68abcf81d58" />


Technical Tools Used
Tools	Purpose
PostgreSQL	Filtering, data wrangling, custom SQL queries (e.g., age filters, tournament filtering)
Tableau	Visual analytics: bar graphs, line charts, heatmaps, color-coding groups (Big 3 vs Next Gen)
Python	Pre-computing birth years or data cleaning

Conclusion
Carlos Alcaraz and Jannik Sinner are front-runners to succeed the Big 3 in terms of dominance and versatility. Their stats between ages 18–24 mirror early Federer and Nadal trajectories. While others in the Next Gen group show promise, they remain inconsistent. This project sets a foundation for predictive GOAT modeling using longitudinal player stats.

Next Steps / Extension Ideas
- Add Elo ratings or serve/return stats for deeper performance modeling.
- Predictive modeling: Can Alcaraz reach 20 Grand Slam titles by age 30?
- Incorporate injury data and match load to assess long-term sustainability.
