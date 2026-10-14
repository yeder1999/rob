*** Settings ***
Documentation    Page Shopping yedir ben amar
Library    SeleniumLibrary

*** Variables ***
${CATEGORY_FILTER}    css:[data-testid="category-filter"]
${IN_STOCK_TOGGLE}    css:[data-testid="in-stock-toggle"]
${ADD_TO_CART}        css:[data-testid="add-to-cart-5"]
${CART_ITEM_COUNT}    xpath://span[contains(@class,"font-bold") and contains(normalize-space(.),"items")]

*** Keywords ***
Selectionner Categorie Accessories
    Select From List By Label    ${CATEGORY_FILTER}    Accessories

Activer Filtre In Stock
    ${checked}=    Get Element Attribute    ${IN_STOCK_TOGGLE}    checked
    IF    $checked == $None
        Click Element    ${IN_STOCK_TOGGLE}
    END

Ajouter Produit Au Panier
    Wait Until Element Is Enabled    ${ADD_TO_CART}
    Click Button    ${ADD_TO_CART}

Verifier Nombre Articles Panier
    Wait Until Element Is Visible    ${CART_ITEM_COUNT}
    Element Should Contain    ${CART_ITEM_COUNT}    1 items

Verifier Prix Panier
    [Arguments]    ${prix_attendu}
    Page Should Contain    ${prix_attendu}