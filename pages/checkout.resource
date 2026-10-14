*** Settings ***
Documentation    Page Checkout et paiement
Library    SeleniumLibrary

*** Variables ***
${CART_ITEMS}        xpath://span[contains(@class,"font-bold") and contains(normalize-space(.),"items")]
${BILLING_EMAIL}     css:[data-testid="billing-email"]
${BILLING_PHONE}     css:[data-testid="billing-phone"]
${BILLING_ADDRESS}   css:[data-testid="billing-address"]
${BILLING_CITY}      css:[data-testid="billing-city"]
${BILLING_ZIPCODE}   css:[data-testid="billing-zipcode"]
${BILLING_COUNTRY}   css:[data-testid="billing-country"]
${PAYMENT_CARD}      css:[data-testid="payment-credit-card"]
${CARD_NUMBER}       css:[data-testid="card-number"]
${CARD_NAME}         css:[data-testid="card-name"]
${CARD_EXPIRY}       css:[data-testid="card-expiry"]
${CARD_CVV}          css:[data-testid="card-cvv"]
${PLACE_ORDER}       css:[data-testid="place-order"]
${PAYMENT_SUCCESS}   css:[data-testid="payment-success"]
${DOWNLOAD_INVOICE}    css:[data-testid="download-invoice"]

*** Keywords ***
Ouvrir Checkout
    Wait Until Element Is Visible    ${CART_ITEMS}
    Scroll Element Into View    ${CART_ITEMS}
    Click Element    ${CART_ITEMS}
    Wait Until Element Is Visible    ${BILLING_EMAIL}    10s

Remplir Informations Facturation
    Input Text    ${BILLING_EMAIL}      client.test@example.com
    Input Text    ${BILLING_PHONE}      0612345678
    Input Text    ${BILLING_ADDRESS}    10 rue de Paris
    Input Text    ${BILLING_CITY}       Paris
    Input Text    ${BILLING_ZIPCODE}    75001
    Select From List By Label    ${BILLING_COUNTRY}    France

Choisir Paiement Carte
    Click Element    ${PAYMENT_CARD}
    Wait Until Element Is Visible    ${CARD_NUMBER}

Remplir Informations Carte
    Input Text    ${CARD_NUMBER}    4242 4242 4242 4242
    Input Text    ${CARD_NAME}      yedir ben amar
    Input Text    ${CARD_EXPIRY}    12/30
    Input Text    ${CARD_CVV}       123

Valider Commande
    Click Button    ${PLACE_ORDER}

Verifier Paiement Reussi
    Wait Until Element Is Visible    ${PAYMENT_SUCCESS}    10s
    Element Text Should Be    ${PAYMENT_SUCCESS}    Payment Successful!
Telecharger Facture PDF
    Wait Until Element Is Visible    ${DOWNLOAD_INVOICE}    10s
    Click Button    ${DOWNLOAD_INVOICE}