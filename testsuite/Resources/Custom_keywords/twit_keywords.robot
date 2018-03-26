*** Settings ***
Resource                            ${CURDIR}/../page_objects/common_settings.robot
Library                             String
Documentation                       First test
Library                             Selenium2Library


*** Variables ***
${followstate}     Follow
${status}

*** Keywords ***

Login To Twitter As

|  | [Arguments]                 | ${email}                        | ${password} |  # providing email and password of the user |
|  | [Tags]                      | Ok                              |             |
|  | Open Browser                | ${web_url}                      | ${browser}  |
|  | Wait Until Page Contains    | Twitter                         |             |
|  | Page Should Contain Element | name=session[username_or_email] |             |
|  | Input Text                  | name=session[username_or_email] | ${email}    |
|  | Sleep                       | 3                               |             |
|  | Click Element               | name=session[password]          |             |
|  | Input Password              | name=session[password]          | ${password} |
|  | Click Element               | //input[@value='Log in']        |             |
|  | Wait Until Page Contains    | Twitter                         |             |




Search And Load Profile

|  | [Arguments]                      | ${thandle}                  |            |  |  # providing twitter handle
|  | [Tags]                           | Ok                          |            |  |
|  | Click Element                    | id=search-query             |            |  |
|  | Input Text                       | id=search-query             | ${thandle} |  |
|  | Click Element                    | //button[@type='submit']    |            |  |
|  | Wait Until Page Contains         | People                      |            |  |
|  | Sleep                            | 3                           |            |  |
|  | Wait Until Page Contains Element | link=People                 |            |  |
|  | Click Element                    | link=People                 |            |  |
|  | Wait Until Page Contains         | ${thandle}                  |            |  |
|  | Sleep                            | 3                           |            |  |
|  | Click Element                    | link=@${thandle}            |            |  |
|  | Sleep                            | 3                           |            |  |
|  | Element Should Contain           | //h2/a/span/b               | ${thandle} |  |
|  | Wait Until Page Contains Element | //span[2]/button            |            |  |


Check User Profile And Follow

|  | [Tags]         | Ok                               |                                  |  |
|  | ${text}        | Get Text                         | css=.follow-button >button >span |  |
|  | Run Keyword If | '${followstate}'  == '${status}' | Follow User                      |  |
|  | ...            | ELSE                             | Logout                           |  |


Follow User

|  | [Tags]                           | Ok                         |            |  |
|  | Element Should Contain           | //h2/a/span/b              | ${thandle} |  |
|  | Wait Until Page Contains Element | css=.follow-button >button |            |  |
|  | Click Element                    | css=.follow-button >button |            |  |
|  | Logout                           |                            |            |  |
|  | Close Browser                    |                            |            |  |


Logout

|  | [Tags]                           | Ok                                         |  |  |
|  | Click Element                    | id=user-dropdown-toggle                    |  |  |
|  | Wait Until Page Contains Element | css=#signout-button > button.dropdown-link |  |  |
|  | Click Element                    | css=#signout-button > button.dropdown-link |  |  |
|  | Close Browser                    |                                            |  |  |
