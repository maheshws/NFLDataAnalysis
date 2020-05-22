# NFLDataAnalysis
Repo for collaborating on an ETL Project

Extract:

Our report focused on creating a single dataset that presented data from both the NFL Combine and NFL All-Pro Teams. This data merge would help to examine whether draft position and biomechanics had any effect on a player’s selection to a given year’s All-Pro roster. Every year, top college prospects are invited to the NFL Combine where exact biomechanical measurements are taken. Those selected to each year’s All-Pro roster are considered to be the best players at their position in the National Football League. 

Our original sources for this ETL project were Wikipedia and Kaggle. With the Python's splinter function, using Jupyter Notebook we were able to scrape every All-Pro Team page from 1987 to 2017 returning player names. From Kaggle we took an Excel spreadsheet that had the biomechanical measurements and draft position of players going back to the 1987 NFL Combine. 

Transform:

At the NFL Combine, participants can opt out of certain events. The minimal requirement is that their height and weight is measured. Other tests, such as the 40 yard dash and the Wonderlic, are optional. Due to the various choices of each player the data in the Excel spreadsheet was not uniform. Therefore some data cleaning was required. As for the web scraping from Wikipedia, there were issues with the underlying HTML code that returned values that were not player names. This happened with the 1996 and 1997 All-Pro Team page where the First Team All-Pro Quarterback selection, Brett Favre, was not a hyperlink so our web scraping script in Python returned “Green Bay Packers” instead of Favre. To fix this, our dictionary returned only unique values and “Green Bay Packers” was dropped as it is not a player’s name. 

In order to clean up the data a little more and reduce overall file size, when assembling our final dataset we dropped measurements and the draft position of players that were not All-Pro. 

Load:

We used postgres to create the final database because it is a relational database and that is what we are most familiar with.
