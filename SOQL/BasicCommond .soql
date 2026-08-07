
// 1. Get all Accounts

SELECT Id, Name FROM Account

// 2. Get Accounts with Phone number
SELECT Id, Name, Phone
FROM Account

// 3. Get Contacts whose email is available

SELECT Id, FirstName, LastName, Email
FROM Contact
WHERE Email != NULL

// 4. Get Accounts from India

SELECT Id, Name, BillingCountry
FROM Account
WHERE BillingCountry = 'India'

// 5. Get latest 10 Accounts

SELECT Id, Name, CreatedDate
FROM Account
ORDER BY CreatedDate DESC
LIMIT 10