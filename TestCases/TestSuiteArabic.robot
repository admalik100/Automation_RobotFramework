*** Settings ***
Documentation  Ounass Automation Framework Prototype
Resource  ../Resources/CommonResources.robot
Test Setup  StartTests
Test Teardown  FinishTests
*** Test Cases ***
Arabic Register User Verify Email And Update Ph No
    [Documentation]  Register new user/ Verify Email and add Ph no
    dismissDialog
    ChangeLanguageToArabic
    NavigateToRegisterUser
    VerifyEmailAndAddPhNoArabic