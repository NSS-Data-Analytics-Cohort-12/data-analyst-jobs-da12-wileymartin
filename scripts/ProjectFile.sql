--- 1.	How many rows are in the data_analyst_jobs table?
Select Count (*)
From data_analyst_jobs;

--- 1793
	

--- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
Select company 
From data_analyst_jobs
Limit 10;

--- ExxonMobil

--- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
Select title, location
From data_analyst_jobs
Where Location IN ('KY','TN');

--- 27


--- 4.	How many postings in Tennessee have a star rating above 4?
Select title, star_rating
From data_analyst_jobs
Where (star_rating > 4);

--- 416

--- 5.	How many postings in the dataset have a review count between 500 and 1000?
Select review_count, title
From data_analyst_jobs
Where review_count Between 500 AND 1000;

--- 151


--- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?
Select company, location AS state, AVG(star_rating) AS avg_rating
From data_analyst_jobs
Group by company, state
Order by avg_rating DESC;

--- TN

--- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

Select COUNT (Distinct title)
From data_analyst_jobs;

--- 881

--- 8.	How many unique job titles are there for California companies?
SELECT location, COUNT (DISTINCT title)
From data_analyst_jobs
Where location = 'CA'
Group BY location; 

--- 230

--- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?
Select company, review_count, Avg(star_rating)
From data_analyst_jobs
Where review_count > 5000
Group by company, review_count;

--- 46

--- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
Select company, review_count, Avg(star_rating) AS avg_rating
From data_analyst_jobs
Where review_count > 5000
Group by company, review_count
Order by avg_rating DESC;

--- Microsoft 
--- 4.1999998090000000

--- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
Select title
From data_analyst_jobs
Where title like 'A%';

--- 76

--- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?
Select title 
From data_analyst_jobs
Where title not like '%A%';

--- 2 
--- These jobs are common in the fact that they are both involved with Tableau.


--- 13. Bonus. You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
Select title,domain,days_since_posting,skill
From data_analyst_jobs
WHERE domain IS NOT NULL
AND days_since_posting > 21
AND skill ='SQL'
Order BY days_since_posting DESC;


--- I assumed that if the "days since posting" is high for a company, that this must mean this role is receiving a lot of resumes and attenntion, therefore the company is not actively refreshing their job posting. Another key inisght is that this means this job posting in comparison to others, maybe more lucrateive if it has received more attention, making it more difficult to get. This could be due to pay or even the company's workplace reviews online.  So I ordered by this column descending to identify the top industries that have 30 days since a job post for the skillset SQL.
---1. Consulting and Business Services
---2. Computers and Electronics
---3. Real Estate
---4. Consumer Goods and Services 

---- All these industries have been listed for more than three weeks by the way. 
