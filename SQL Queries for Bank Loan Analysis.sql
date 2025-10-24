SELECT * FROM Bank_Loan_Data

SELECT COUNT(id) AS Total_Loan_Applications FROM Bank_Loan_Data

SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate)*100,2) AS Average_Interest_Rate FROM Bank_Loan_Data

SELECT ROUND(AVG(int_rate)*100,2) AS MTD_Average_Interest_Rate FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate)*100,2) AS PMTD_Average_Interest_Rate FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti)*100,2) AS Average_DTI FROM Bank_Loan_Data

SELECT ROUND(AVG(dti)*100,2) AS MTD_Average_DTI FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(dti)*100,2) AS PMTD_Average_DTI FROM Bank_Loan_Data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

 SELECT
	(COUNT (CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
	/
	COUNT(id) AS Good_Loan_Percentage
FROM Bank_Loan_Data

SELECT COUNT(id) AS Good_Loan_Applications FROM Bank_Loan_Data 
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM Bank_Loan_Data 
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM Bank_Loan_Data 
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

SELECT
	(COUNT (CASE WHEN loan_status = 'Charged Off' THEN id END)*100)
	/
	COUNT(id) AS Bad_Loan_Percentage
FROM Bank_Loan_Data

SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM Bank_Loan_Data 
WHERE loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Bad_Loan_Received_Amount FROM Bank_Loan_Data 
WHERE loan_status = 'Charged Off'

SELECT
	loan_status,
	Count(id) AS Total_Loan_Applications,
	SUM(total_payment) AS Total_Amount_Received,
	SUM(loan_amount) AS Total_Funded_Amount,
	AVG(int_rate)*100 AS Interest_Rate,
	AVG(dti)*100 as DTI
FROM 
	Bank_Loan_Data
GROUP BY
	loan_status

SELECT
	loan_status,
	SUM(total_payment) AS MTD_Total_Amount_Received,
	SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM 
	Bank_Loan_Data
WHERE
	MONTH(issue_date) = 12
GROUP BY
	loan_status

SELECT
	MONTH(issue_date) AS Month_Number,
	DATENAME(MONTH, issue_date) AS Month_Name,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM 
	Bank_Loan_Data
GROUP BY
	MONTH(issue_date),DATENAME(MONTH, issue_date)
ORDER BY
	MONTH(issue_date)

SELECT
	address_state,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM 
	Bank_Loan_Data
GROUP BY
	address_state
ORDER BY
	SUM(loan_amount) DESC

SELECT
	emp_length,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM 
	Bank_Loan_Data
GROUP BY
	emp_length
ORDER BY
	emp_length

SELECT
	purpose,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM 
	Bank_Loan_Data
GROUP BY
	purpose
ORDER BY
	COUNT(id) DESC

SELECT
	home_ownership,
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM 
	Bank_Loan_Data
GROUP BY
	home_ownership
ORDER BY
	COUNT(id) DESC