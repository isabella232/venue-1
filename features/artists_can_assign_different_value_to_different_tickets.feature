Feature: Artists can assign different values to different tickets
    As an Artist, 
    In order to motivate my fans to quickly buy tickets,
    I would like to assign different price and quantity to the tickets.

    Background:
        Given the following campaign exist
            | title                        | description                                | location  | state    |
            | Veronica Maggio in Stockholm | Don't miss a fantastic singer in September | Stockholm | accepted |

        Given the following tickets for 'Veronica Maggio in Stockholm' exist
            | name       | price | count |
            | Sure thing | 200   | 200   |