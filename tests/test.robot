*** Settings ***
Documentation    Test du parcours Shopping
Resource    ../resources/keyword.resource
Resource    ../pages/shop.resource
Resource    ../pages/check.resource 

Test Setup       Init
Test Teardown    Fermer

*** Test Cases ***
Filtrer Accessories Ajouter Un Produit Et Verifier Panier
    Selectionner Categorie Accessories
    Activer Filtre In Stock
    Ajouter Produit Au Panier
    Verifier Nombre Articles Panier    1 items
    Ouvrir Checkout
    Remplir Informations Facturation
    Choisir Paiement Carte
    Remplir Informations Carte
    Valider Commande
    Verifier Paiement Reussi
    Telecharger Facture PDF