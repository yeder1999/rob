*** Settings ***
Documentation    Page Checkout et paiement
Library    SeleniumLibrary

*** Variables ***
${cart_items}        xpath://span[contains(@class,"font-bold") and contains(normalize-space(.),"items")]
${billing_email}     css:[data-testid="billing-email"]
${billing_phone}     css:[data-testid="billing-phone"]
${billing_address}   css:[data-testid="billing-address"]
${billing_city}      css:[data-testid="billing-city"]
${billing_zipcode}   css:[data-testid="billing-zipcode"]
${billing_country}   css:[data-testid="billing-country"]
${payment_card}      css:[data-testid="payment-credit-card"]
${card_number}       css:[data-testid="card-number"]
${card_name}         css:[data-testid="card-name"]
${card_expiry}       css:[data-testid="card-expiry"]
${card_cvv}          css:[data-testid="card-cvv"]
${place_order}       css:[data-testid="place-order"]
${payment_success}   css:[data-testid="payment-success"]
${download_invoice}  css:[data-testid="download-invoice"]

*** Keywords ***
Ouvrir Checkout
    Wait Until Element Is Visible    ${cart_items}
    Scroll Element Into View    ${cart_items}
    Click Element    ${cart_items}
    Wait Until Element Is Visible    ${billing_email}    10s

Remplir Informations Facturation
    Input Text    ${billing_email}      yedir.test@example.com
    Input Text    ${billing_phone}      0773624723
    Input Text    ${billing_address}    10 rue de Paris
    Input Text    ${billing_city}       Paris
    Input Text    ${billing_zipcode}    75001
    Select From List By Label    ${billing_country}    France

Choisir Paiement Carte
    Click Element    ${payment_card}
    Wait Until Element Is Visible    ${card_number}

Remplir Informations Carte
    Input Text    ${card_number}    4242 4242 4242 4242
    Input Text    ${card_name}      yedir ben amar
    Input Text    ${card_expiry}    12/30
    Input Text    ${card_cvv}       123

Valider Commande
    Click Button    ${place_order}

Verifier Paiement Reussi
    Wait Until Element Is Visible    ${payment_success}    10s
    Element Text Should Be    ${payment_success}    Payment Successful!

Telecharger Facture PDF
    Wait Until Element Is Visible    ${download_invoice}    10s
    Click Button    ${download_invoice}