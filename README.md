# Bank Tech Test

---------------------------------------------------------

## Requirements:
 - Interaction with a REPL
 - Deposit feature
 - Withdraw feature
 - A/C statement printing feature (data, amount, balance)
 - Data kept in memory (not a database)

---------------------------------------------------------

## User stories:

```
As a bank customer
I want to be able to open up an account
So I can use the bank's services.
```
```
As a bank customer
I want to be able to deposit money in my account
So it is safely stored.
```
```
As a user
I want to withdraw money
So I can buy stuff.
```
```
As a user
I want to print off my statement
So I can see my balance and what transfers I've made and when
```

---------------------------------------------------------


## Input | Output

-----
deposit(amount)
500 

----
withdraw(amount)




-----
print_statement


---------------------------------------------------------
Edge cases/points to clarify

- Can open an account with nothing?
- Blank message when no transfers yet?

- Overdraft allowed?
- Amounts as strings?

- How to test def initialize?


---------------------------------------------------------
Process
- Set up repo
    - initialize rspec
    - initialize git
- Decide what classes are needed
- Draw up class, state, method diagram
- README
    - Rewrite requirements
    - User stories
    - Input / output table
- Test can open an account
- Test print_statement method returns column headers before transfers made
- 


- Edge cases