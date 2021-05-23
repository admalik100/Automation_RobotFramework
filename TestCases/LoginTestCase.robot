*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${browser}  chrome
${url}  https://www.ounass.ae/
${dialogBoxCancel}  id:wzrk-cancel
${account}  class:Popup-button
${fbDiv}  class:SignInThirdpartyButtons-facebookButton
${fbLogin}  class:SignInThirdpartyButtons-facebookButton
${fbPage}  class:_9axz
${fbEmail}  id:email
${fbPass}  id:pass
${fbLoginBtn}  id:loginbutton
${mainDiv}  class:Base-content
${accDiv}  class:Popup-iconText
${myAccount}  My Account
${edit}  Edit
${emailDetails}  class:Profile-email
${accDetailsDiv}  class:MyAccountPage-value
*** Test Cases ***
LoginTest
    [Documentation]  This testcase verifies that the user can succesfully login via facebook, and that email is uneditable post login
    open browser    ${url}  ${browser}
    wait until element is visible    ${dialogBoxCancel}
    click button  ${dialogBoxCancel}
    wait until element is visible  ${account}
    click button  ${account}
    wait until element is visible  ${fbDiv}
    click button  ${fbLogin}
    wait until element is visible  ${fbPage}
    input text  ${fbEmail}  samad@werplay.com
    input text  ${fbPass}  werplayru55
    click button  ${fbLoginBtn}
    wait until element is visible  ${mainDiv}
    mouse over  ${accDiv}
    click link  ${myAccount}
    wait until element is visible  ${accDetailsDiv}
    click link  ${edit}
    wait until element is visible  ${emailDetails}
    element should be disabled  ${emailDetails}
    close browser

*** Keywords ***


