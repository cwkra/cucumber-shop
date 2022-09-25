Feature: check stocks
    As a store owner, in order to keep track of stock,
    I want product stocks to be cut when customer buy product

    Background:
        Given the store is ready to service customers
        And a product "Sapients" with price 100 and stock of 10 exists
        And a product "Bread" with price 20.50 and stock of 5 exists
        And a product "Jam" with price 80.00 and stock of 10 exists

    Scenario: Cut stock for one product

        When I buy "Sapients" with quantity 2
        Then "Sapients" มีสต็อคเป็น 8

    Scenario: Cut stock for multiple products
        When I buy "Sapients" with quantity 2
        And I buy "Bread" with quantity 3
        Then "Sapients" มีสต็อคเป็น 8
        And "Bread" มีสต็อคเป็น 2

    Scenario Outline: Cut stock for one product
        When I buy <product> with quantity <quantity>
        Then <product> มีสต็อคเป็น <stock>
        Examples:
            | product     | quantity |  stock |
            | "Sapients"  |     2    |    8   |
            | "Bread"     |     3    |    2   |
            | "Jam"       |     3    |    7   |