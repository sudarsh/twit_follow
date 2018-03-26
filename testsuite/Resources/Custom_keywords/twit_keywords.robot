*** Settings ***
Resource                            /Users/sudarsh/PycharmProjects/twit/testsuite/Resources/page_objects/variables.robot
Library                             String
Documentation                       First test
Library                             Selenium2Library
Library                             Sele

*** Variables ***
${values}      Unfollow Unfollow @${thandle}
${var}

*** Keywords ***

Login as a test user
|  | [Tags]                      | Ok                              |            |
|  | Open Browser                | ${web_url}                      | ${browser} |
|  | wait until page contains    | Twitter                         |            |
|  | page should contain element | name=session[username_or_email] |            |
|  | input text                  | name=session[username_or_email] | ${email}   |
|  | sleep                       | 3                               |            |
|  | click element               | name=session[password]          |            |
|  | input password              | name=session[password]          | ${pass}    |
|  | click element               | //input[@value='Log in']        |            |
|  | wait until page contains    | Twitter                         |            |




Locate user
|  |                                  |                                              |                                      |
|  | click element                    | id=search-query                          |                                                     |
|  | input text                       | id=search-query                          | ${thandle}                                          |
|  | click element                    | //button[@type='submit']                 |                                                     |
|  | wait until page contains         | People                                   |                                                     |
|  | sleep                            | 3                                        |                                                     |
|  | Wait Until Page Contains Element | link=People                              |                                                     |
|  | click element                    | link=People                              |                                                     |
|  | wait until page contains         | ${thandle}                               |                                                     |
|  | sleep                            | 3                                        |                                                     |
|  | click element                    | link=@${thandle}                         |                                                     |
|  | sleep                            | 3                                        |                                                     |
|  | Element Should Contain           | //h2/a/span/b                            | ${thandle}                                          |
|  | Wait Until Page Contains Element | //span[2]/button                         |                                                     |
|  | sleep                            | 5                                        |                                                     |
|  | ${text}                          | Get Text                                 | css=div.including > span.user-actions-follow-button |
|  | sleep                            | 5                                        |                                                     |
|  | Log                              | ${text}                                  |                                                     |
|  | Log                              | ${thandle}                               |                                                     |
|  | run keyword if                   | '${text}' == 'Following/nFollowing'      | Follow user                                         |
|  | ...                              | ELSE                                     | logout                                              |
|  |                                  |                                          |                                                     |
|  |                                  |                                          |                                                     |

Follow user
|  | Element Should Contain           | //h2/a/span/b    | ${thandle} |
|  | Wait Until Page Contains Element | //span[2]/button |            |
|  | click element                    | //span[2]/button |            |


Logout

|  | click element                    | id=user-dropdown-toggle                    |  |
|  | wait until page contains element | css=#signout-button > button.dropdown-link |  |
|  | click element                    | css=#signout-button > button.dropdown-link |  |
|  | close Browser                    |                                            |  |

