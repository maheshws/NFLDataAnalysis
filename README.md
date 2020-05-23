<img src="1200px-National_Football_League_logo.svg.png" width="200" height="220">

# NFLDataAnalysis
Repo for collaborating on an ETL Project

**Extract:**

Our report focused on creating a single dataset that presented data from both the NFL Combine and NFL All-Pro Teams. This data merge would help to examine whether draft position and biomechanics had any effect on a player’s selection to a given year’s All-Pro roster. Every year, top college prospects are invited to the NFL Combine where exact biomechanical measurements are taken. Those selected to each year’s All-Pro roster are considered to be the best players at their position in the National Football League. 

Our original sources for this ETL project were Wikipedia and "Data.World". With the Python's splinter function, using Jupyter Notebook we were able to scrape every All-Pro Team Wikipedia page from 1987 to 2017 returning player names. We went through each player on the All Pro rosters' Wikipedia page and used their draft year to distinguish players with the same name. From "Data.World" we took an Excel spreadsheet that had the biomechanical measurements, draft position, and college statistics of player going back to the 1987 NFL Combine. 

**Transform:**

At the NFL Combine, participants can opt out of certain events. The minimal requirement is that their height and weight is measured. Other tests, such as the 40 yard dash and the Wonderlic, are optional. Due to the various personal choices of each combine participant, the data in the Excel spreadsheet was not uniform. Therefore some data cleaning was required. As for the web scraping from Wikipedia, there were issues with the underlying HTML code that returned values that were not player names. For example, this happened with the 1996 and 1997 All-Pro Team pages where the First Team All-Pro Quarterback selection, Brett Favre, was not a hyperlink so our web scraping script in Python returned “Green Bay Packers” instead of Favre. To fix this, our dictionary returned only unique values and “Green Bay Packers” was dropped as it is not a player’s name. 

In order to clean up the data a little more and reduce overall file size, when assembling our final dataset we dropped measurements and the draft position of players that were not All-Pro. 

**Load:**

We used postgres to create the final database because it is a relational database and that is what we are most familiar with. SQLAlchemy was used to create the engine to establish the relational database with Pandas. We ran into problems with the merged data frame where players with the same name appeared. We remedied this problem by looking at a player's draft year to distinguish them. 

After the data-transformation step using DataFrames, the PostgreSQL schema was built using "QuickDBD-export_NFL_Tables.sql". This SQL file created 5 tables that were populated through the DataFrames built during the data-Transform process. The database diagram is depicted by the "db-diagram.png" file: 
