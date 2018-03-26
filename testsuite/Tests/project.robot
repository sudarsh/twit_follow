*** Settings ***

Resource          ${CURDIR}/../Resources/page_objects/common_settings.robot


*** Test Cases ***

Search And Follow The User

|  | Login To Twitter As           | smsworkz@gmail.com | welcome123 |
|  | Search And Load Profile       | POTUS              |            |
|  | Check User Profile And Follow |                    |            |




