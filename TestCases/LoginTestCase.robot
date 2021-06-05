*** Settings ***
Documentation  Ounass Automation Framework Prototype
Resource  ../Resources/CommonResources.robot
Test Setup  StartTests
Test Teardown  FinishTests

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
${women}  link:WOMEN
${sale}  link:SALE
${product}  class:Product-contents
${addToBag}  class:AddToBag
${dropDown}  class:Select-control
${status}
${bagLoad}  class:MiniCart-container
${dropDownText}  class:Select-value-label
${dropDownPlaceholder}  class:Select-placeholder
${unselectedSize}  Select Size
${dropDownOption1}  id:react-select-2--option-0
${navigateToBag}  link:GO TO BAG
${btnCheckout}  class:CartTotal-secureCheckout
${inputFName}  id:firstName
${inputLName}  id:lastName
${inputEmail}  id:email
${inputPhNo}  id:mobileNumber
${IncorrectNo}  class:NewAddress-fieldErrorText
${clothing}  link:CLOTHING
${searchDesignerProduct}  class:QuickSearch-v2-textBox
${searchShowAllResult}  link:SHOW ALL RESULTS
${resultItems}  class:PLP-resultCount
${totalCountItems}
${productBrand}  class:Product-brand
${comparison}
*** Test Cases ***
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
