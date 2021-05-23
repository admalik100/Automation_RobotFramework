*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://www.ounass.ae/

*** Test Cases ***
LoginTest
    open browser    ${url}  ${browser}
    wait until element is visible    id:wzrk-cancel
    click button  id:wzrk-cancel
    wait until element is visible  class:Popup-button
    click button  class:Popup-button
    wait until element is visible  class:SignInThirdpartyButtons-facebookButton
    click button  class:SignInThirdpartyButtons-facebookButton
    wait until element is visible  class:_9axz
    input text  id:email  samad@werplay.com
    input text  id:pass  werplayru55
    click button  id:loginbutton
    wait until element is visible  class:Base-content
    mouse over  class:Popup-iconText
    click link  My Account
    wait until element is visible  class:MyAccountPage-value
    click link  Edit
    wait until element is visible  class:Profile-email
    element should be disabled  class:Profile-email
    close browser

*** Keywords ***


