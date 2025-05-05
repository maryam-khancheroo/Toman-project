*** Settings ***
Library           SeleniumLibrary
Resource          config.resource

*** Test Cases ***
Login To Digikala With Phone And Password
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@name="username"]    10s
    Input Text    xpath=//input[@name="username"]    ${PHONE}
    Click Button    xpath=//button[contains(.,'ورود')]
    Wait Until Element Is Visible    xpath=//input[@name="password"]    10s
    Input Password    xpath=//input[@name="password"]   ${PASSWORD}
    Click Button    xpath=//button[contains(.,'تایید')]
    Wait Until Element Is Visible    xpath=//button[contains(.,'فعلا نه')]    10s
    Click Button    xpath=//button[contains(.,'فعلا نه')]
    Wait Until Element Is Visible    xpath=//div[@data-cro-id="HP-profile-header"]    10s
    Click Element    xpath=//div[@data-cro-id="HP-profile-header"]
    Element Should Be Visible    xpath=//span[normalize-space(text())="خروج از حساب کاربری"]

    Capture Page Screenshot
    [Teardown]    Close Browser


*** Variables ***
${WRONG_PASSWORD}  wrongpass123!

*** Test Cases ***
Unsuccessful Login To Digikala
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@name="username"]    10s
    Input Text    xpath=//input[@name="username"]    ${PHONE}
    Click Button    xpath=//button[contains(.,'ورود')]
    Wait Until Element Is Visible    xpath=//input[@name="password"]    10s
    Input Password    xpath=//input[@name="password"]    ${WRONG_PASSWORD}
    Click Button    xpath=//button[contains(.,'تایید')]
    Wait Until Page Contains Element    xpath=//div[contains(text(),'اطلاعات کاربری نادرست است')]    10s
    Element Should Be Visible           xpath=//div[contains(text(),'اطلاعات کاربری نادرست است')]

    Capture Page Screenshot
    [Teardown]    Close Browser

*** Variables ***
${PRODUCT_NAME}   Galaxy S25 Ultra

*** Test Cases ***
Search And Add Product To Cart In Digikala
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//button[contains(.,'فعلا نه')]    10s
    Click Button    xpath=//button[contains(.,'فعلا نه')]
    Wait Until Element Is Visible    xpath=//div[normalize-space(text())="جستجو"]    10s
    Click Element                    xpath=//div[normalize-space(text())="جستجو"]
    Wait Until Element Is Visible    xpath=//input[@name="search-input"]    10s
    Input Text                      xpath=//input[@name="search-input"]    ${PRODUCT_NAME}
    Press Keys                      xpath=//input[@name="search-input"]    RETURN
    Wait Until Page Contains Element    xpath=//div[@data-product-index="1"]//a    10s
    Click Element                        xpath=//div[@data-product-index="1"]//a
    Switch Window                       locator=NEW
    Wait Until Page Contains Element        xpath=//div[@data-testid="buy-box"]//button[@data-testid="add-to-cart"]
    Click Element                        xpath=//div[@data-testid="buy-box"]//button[@data-testid="add-to-cart"]
    Wait Until Page Contains Element        xpath=//div[normalize-space(text())="برو به سبد خرید"]
    Click Element                       xpath=//div[normalize-space(text())="برو به سبد خرید"]
    Wait Until Page Contains            سبد خرید شما    10s
    Wait Until Page Contains                  ${PRODUCT_NAME}

    Capture Page Screenshot
    [Teardown]    Close Browser
