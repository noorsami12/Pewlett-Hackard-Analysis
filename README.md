# Pewlett-Hackard-Analysis

## Overview 

For the purposes of this analysis, I analyzed employee data for Pewlett Hackard to identify the number of retiring employees. I broke the data down to organize retirees by department as well as title. Additionally, I identified employees who are eligible to participate in a mentorship program to prepare for the wave of new hires that will follow the retirements. 

Using SQL to run queries on various csv files full of employee data, I narrowed the employees down by their most recent job title, then used the COUNT function to create a table identifying the number of retirement-eligible employees per title. Following this, I wrote queries to narrow down remaining employees to those that were born in 1965 and therefore eligible to participate in a mentorship program. 

## Results

The results shown by the analysis provide a number of important insights. 
- The role of “Senior Engineer” faces the greatest turnover rate as almost 26,000 employees are up for retirement under that title. 
- Following at a close second, almost 25,000 employees are eligible for retirement under the title of “Senior Staff.”
- The role of “Manager” faces the least turnover, with only two employees eligible for retirement. 
- The mentorship eligibility table shows us 1550 employees who are eligible to mentor new hires. This number will not be enough to deal with the large turnover rate that is expected by our retirement data. 
- However, as the majority of retiring positions are at the “Senior” level, a number of in-house staff can be promoted to replace those positions, while new hires are hired at entry-level roles. This will result in less need for mentorship overall. 

| Count  | Title              |
| ------ | ------------------ |
| 25916  | Senior Engineer    |
| 24926  | Senior Staff       |
| 9285   | Engineer           |
| 7636   | Staff              |
| 3603   | Technique Leader   |
| 1090   | Assistant Engineer |
| 2      | Manager            |


##Summary

If the “silver tsunami” takes effect as predicted by the data, there will be 72,458 roles needing to be filled in Pewlett Hackard. However, a majority of retiring positions are under the title of “Senior” - 26,000 Senior Engineers and 25,000 Senior Staff for a total of 51,000 roles. Many of these roles can potentially be filled in-house by promotions of Engineers and Staff. As a result, new hires will primarily be for the roughly 20,000 non-Senior positions. With only 1,550 employees eligible for mentorship, this still leaves us with a 1:13 ratio for mentorship, which could be too hefty of a load for each mentor to handle. 

###Additional Tables 
For further insight into the “silver tsunami,” a table could be generated that further breaks down the mentorship eligibility by title. An eligible mentor with the title of “Staff” might not be the best choice to mentor a new hire in the position of “Engineer,” and breaking down the titles will give us a better picture of where our areas of need are in terms of mentorship. The queries for this table would be similar to the code used to generate the retirement titles table, only we would draw from the mentorship eligibility table instead. The following code could be refactored to draw from the mentorship eligibility table: 
```
SELECT COUNT(unique_titles.title), unique_titles.title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;
```
Another table we could generate would be to expand the definitions of mentorship eligiblity and include employees born in more years than just 1965. This may ease the burden on mentorship eligible employees by finding more employees eligible to deal with the potential upcoming wave of new hires.
