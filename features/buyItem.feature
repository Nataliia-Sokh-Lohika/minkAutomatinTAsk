Feature: To buy an item I need to
  choose it, check out, set payment data, login to Paypal and finally buy it.

@javascript
  Scenario: Full positive flow (light version, no serious checks)
  Given I am on "/store/test-paypal-business/marketing/personal-offer-from-test-paypal-business-1#product/2791"
  When I click 'Buy this item'
  Then I click 'Proceed to checkout'
  Then I select "Mr" from 'Salutation'
  And I fill in shipping data "firstName" with "Test Name"
  And I fill in shipping data "lastName" with "Test Last Name"
  And I fill in shipping data "phone" with "+380975436543"

  And I fill in shipping data "addressAutocomplete" with "Sreet"
  And I click ".icon"
  And I fill in shipping data "street" with "Street auto test"
  And I fill in shipping data "streetNumber" with "57"
  And I fill in shipping data "city" with "City"
  And I select "United States" from "shipping_step_newShippingAddress_country"
  And I fill in shipping data "zipCode" with "57354354"

  Then I press "Next"
  And I fill in "payment_dto_payment_customerEmail" with "baloonisred@gmail.com"
  And I check "payment_dto_acceptTermsPayever"
  Then I click ".footer-submit-btn"

  Then I switch to frame "injectedUl"
  Then I fill in "login_email" with "baloonisred@gmail.com"
  And I fill in "password" with "1q2w3e4r5t"
  Then I press "btnLogin"

  Then I switch to window
  Then I click "#submitBtnMeft"
  Then I click "#confirmButtonTop"

  Then I should see "Payment successfull" in the ".ticket-heading" element
