--Get all users from Chicago
select username from accounts where city = 'Chicago'

--get all users with usernames that contain the letter 'a'
select username from accounts where username like '%a%'

--The bank is giving a new customer bonus! Update all records with an account balance of 0.00 and a transactions_attempted of 0. Give them a new account balance of 10.00.
UPDATE accounts set account_balance = 10.00 where account_balance = 0.00 and transactions_attempted = 0

--Select all users that have attempted 9 or more transactions.
select * from accounts where transactions_attempted >= 9

--Get the username and account balance of the 3 users with the highest balances, sort highest to lowest balance. NOTE: Research LIMIT
select username, account_balance from accounts order by account_balance desc limit 3

--Get the username and account balance of the 3 users with the lowest balances, sort lowest to highest balance.
select username, account_balance from accounts order by account_balance asc limit 3

--Get all users with account balances that are more than $100.
select * from accounts where account_balance > 100

--Add a new record
BEGIN;
INSERT INTO accounts (username, city, transactions_completed, transactions_attempted, account_balance) VALUES ('TheDude', 'Minneapolis', 1, 1, 4321.09)
--COMMIT

--The bank is losing money in Miami and Phoenix and needs to unload low transaction customers: Delete users that reside in miami OR phoenix and have completed fewer than 5 transactions.
BEGIN;
DELETE from accounts where transactions_completed < 5 and (city = 'miami' or city = 'phoenix')
--COMMIT