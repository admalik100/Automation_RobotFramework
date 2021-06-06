*** Settings ***
Documentation  Ounass Automation Framework Prototype
Resource  ../Resources/CommonResources.robot
Test Setup  StartTests
Test Teardown  FinishTests

*** Test Cases ***
Register User Verify Email And Update Ph No
    dismissDialog
    NavigateToRegisterUser
    VerifyEmailAndAddPhNo
LoginTest
    [Documentation]  Valid Login / Email editing disabled post login]
    dismissDialog
    navigateFBLogin
    loginfb
    checkEmaileditDisabled
    close browser
CheckOut
    [Documentation]  Shop Items and proceed to checkout
    dismissDialog
    click link   ${women}
    wait until element is visible  ${sale}
    click link  ${sale}
    Add Products
    CheckOut
    close browser
ProductListing
    [Documentation]  Search for designer items resulting items should be 2 and accurate
    dismissDialog
    Search For Designer
    Validate Designer Results

*** Keywords ***
