*** Settings ***
Documentation    Test du parcours Shopping
Resource    ../resources/keyword.resource
Resource    ../pages/shopping.resource
Resource    ../pages/checkout.resource

Test Setup       Init
Test Teardown    Fermer

*** Test Cases ***
Filtrer Accessories Ajouter Un Produit Et Verifier Panier
    Selectionner Categorie Accessories
    Activer Filtre In Stock
    Ajouter Produit Au Panier
    Verifier Nombre Articles Panier   
    Ouvrir Checkout
    Remplir Informations Facturation
    Choisir Paiement Carte
    Remplir Informations Carte
    Valider Commande
    Verifier Paiement Reussi 
    Telecharger Facture PDF