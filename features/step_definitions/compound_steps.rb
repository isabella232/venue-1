
Given('there are {int} campaings') do |_int|
  steps %(
    Given the following campaign exist
    | title                        | description                                | location  | state    |
    | Veronica Maggio in Stockholm | Don't miss a fantastic singer in September | Stockholm | accepted |
    | KISS in Stockholm            | Don't miss a fantastic experience          | Stockholm | accepted |

    Given the following tickets for 'Veronica Maggio in Stockholm' exist
        | price |
        | 200   |

    Given the following tickets for 'KISS in Stockholm' exist
        | price |
        | 200   |

    And the following ticket variants for 'Veronica Maggio in Stockholm' exist
        | name        | base_price_percentage |
        | Gig Starter | 50                    |
        | Sure thing  | 50                    |

    And the following ticket variants for 'KISS in Stockholm' exist
        | name             | base_price_percentage |
        | KISS Gig Starter | 50                    |
        | KISS Sure thing  | 50                    |

  )
end
