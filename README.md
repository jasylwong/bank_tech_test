# Bank Tech Test 🏦

[Objective](#Objective) | [Process](#process) | [User Stories](#user_stories) | [Installation](#Installation)

## Objective

Enable the user to create a bank account in which money can be deposited and withdrawn, and statements
printed.

This solution was built using Ruby, and is based on the Makers week 10 tech test challenge 1. [Click here](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md) for the original README.md.

## Process

This is the approach I took for designing and creating this solution:

- Set up repo:
    - Initialize RSpec
    - Initialize Git
    - Setup code coverage (SimpleCov) and code quality (RuboCop) testers

- Verify areas of uncertainty with the client:
    - Overdraft allowed? Yes
    - Overdraft limit? No

- Create user stories (see below) based on the client's requirements

- Draw up class, state, method diagrams based on the user stories:
    - The classes were determined by considering the nouns in the user stories.
        I decided on three overall: transactions, amounts and statements, as they 
            are all distinct objects in real life. This also helped with the encapsulation principle.
    - Accounts are made up of transactions, so the account class depends on the transaction objects.
    - Statements need information from an account, so the statement class depends on the account object.
    - Methods and attributes for each class were restricted to only what each class could be 
        expected to do/have.

- Write the code, using TDD!
    - Methods were made to adhere to the Single Responsibility Principle as much as possible.
    - As many methods as possible were made private within their respective classes.

- Address edge cases eg. allow for amounts input as strings rather than integers/floats.

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

## Installation

### Setup
```
$ git clone https://github.com/jasylwong/bank_tech_test.git
$ cd bank_tech_test
```

### Testing, code coverage, and code style
```
$ bundle
$ rspec # All tests passing, coverage: 100%
$ rubocop # No offenses
```

### Example usage in irb
```
$ irb
> require './lib/load'
 => true 
> account = Account.new
 => #<Account:0x00007fe10c83f780> 
> account.deposit(350)
 => "Deposit of 350 made. Balance: 350." 
> account.withdraw(200)
 => "Withdrawal of 200 made. Balance: 150." 
> account.balance
 => 150.0 
> statement = Statement.new(account)
 => #<Statement:0x00007fe10b8a3f38> 
> print statement.display
date || credit || debit || balance
03/24/20 || || 200.00 || 150.00
03/24/20 || 350.00 || || 350.00
```
