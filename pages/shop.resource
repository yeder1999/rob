*** Settings ***
Documentation    Page Shopping yedir ben amar
Library    SeleniumLibrary

*** Variables ***
${category_filter}    css:[data-testid="category-filter"]
${in_stock_toggle}    css:[data-testid="in-stock-toggle"]
${add_to_cart}        css:[data-testid="add-to-cart-5"]
${cart_item_count}    xpath://span[contains(@class,"font-bold") and contains(normalize-space(.),"items")]

*** Keywords ***
Selectionner Categorie Accessories
    Select From List By Label    ${category_filter}    Accessories

Activer Filtre In Stock
    ${checked}=    Get Element Attribute    ${in_stock_toggle}    checked
    IF    $checked == $None
        Click Element    ${in_stock_toggle}
    END

Ajouter Produit Au Panier
    Wait Until Element Is Enabled    ${add_to_cart}
    Click Button    ${add_to_cart}

Verifier Nombre Articles Panier
    [Arguments]    ${nombre_attendu}
    Wait Until Element Is Visible    ${cart_item_count}
    Element Should Contain    ${cart_item_count}    ${nombre_attendu}

Verifier Prix Panier
    [Arguments]    ${prix_attendu}
    Page Should Contain    ${prix_attendu}