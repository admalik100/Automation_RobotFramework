*** Settings ***
Library  SeleniumLibrary
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
    launchBrowser
    dismissDialog
    navigateFBLogin
    loginfb
    checkEmaileditDisabled
    close browser
CheckOut
    [Documentation]  Shop Items and proceed to checkout
    launchBrowser
    dismissDialog
    click link   ${women}
    wait until element is visible  ${sale}
    click link  ${sale}
    Add Products
    CheckOut
    close browser
ProductListing
    [Documentation]  Search for designer items resulting items should be 2 and accurate
    launchBrowser
    dismissDialog
    Search For Designer
    Validate Designer Results
*** Keywords ***
launchBrowser
    open browser    ${url}  ${browser}  timeout 5
    maximize browser window
dismissDialog
    wait until element is visible    ${dialogBoxCancel}
    click button  ${dialogBoxCancel}
navigateFBLogin
    wait until element is visible  ${account}
    click button  ${account}
    wait until element is visible  ${fbDiv}
    click button  ${fbLogin}
LoginFB
    wait until element is visible  ${fbPage}
    input text  ${fbEmail}  samad@werplay.com
    input text  ${fbPass}  werplayru55
    click button  ${fbLoginBtn}
checkEmaileditDisabled
    wait until element is visible  ${accDiv}
    mouse over  ${accDiv}
    click link  ${myAccount}
    wait until element is visible  ${accDetailsDiv}
    click link  ${edit}
    wait until element is visible  ${emailDetails}
    element should be disabled  ${emailDetails}
Check Availability of Item
    ${status}=  run keyword and return status  element should be enabled    ${addToBag}
    run keyword if  ${status} == True  Proceed Add To Bag
Proceed Add To Bag
    page should contain button      ${addToBag}
    click button  ${addToBag}
    wait until element is visible  ${bagLoad}
    log to console  Item is buyable/ added to bag
Check Size Selected Status
    ${status}=  run keyword and return status  page should contain element  ${dropDownPlaceholder}
    run keyword if  ${status} == True  Size is Not Selected
Product Select
    wait until element is visible   ${product}
    click element   ${product}
Size is Not Selected
    log to console  Item size is unselected/ proceeding to select size
    click element   ${dropDownPlaceholder}
    mouse over  ${dropDownOption1}
    click element  ${dropDownOption1}
Add Products
    Product Select
    wait until element is visible   ${mainDiv}
    Check Size Selected Status
    Check Availability of Item
    Product Select
    wait until element is visible   ${mainDiv}
    sleep  1
    Check Size Selected Status
    Check Availability of Item
CheckOut
    click link  ${navigateToBag}
    wait until element is visible  ${mainDiv}
    click button  ${btnCheckout}
    wait until element is visible  ${mainDiv}
    input text  ${inputFName}  John
    input text  ${inputLName}  Doe
    input text  ${inputEmail}  John@gmail.com
    input text  ${inputPhNo}  67324238
    Press Keys  None  TAB
    element should not be visible  ${IncorrectNo} , Phone number is not accurate
Search For Designer
    click link  ${women}
    wait until element is visible  ${clothing}
    click link  ${clothing}
    wait until element is visible  ${searchDesignerProduct}
    press keys  ${searchDesignerProduct}  Christian Sirano
    wait until element is visible  ${searchShowAllResult}
    click link  ${searchShowAllResult}
Validate Designer Results
    wait until element is visible  ${resultItems}
    ${totalCountItems}=  get element attribute  ${resultItems}  data-total-hits
    log to console  ${totalCountItems}
    run keyword and continue on failure  should be equal  ${totalCountItems}  2  as per given instructions resulting items should be 2
    ${comparison}=  get text  ${productBrand}
    should be equal  ${comparison}  Christian Sirano  Incorrect products displayed
FinishTests
    close browser