*** Settings ***

Resource          ${CURDIR}/../Resources/page_objects/common_settings.robot


*** Test Cases ***

Search And Follow The User

|  | Login To Twitter As           |       |  |
|  | Search And Load Profile       | POTUS |  |
|  | Check User Profile And Follow |       |  |




