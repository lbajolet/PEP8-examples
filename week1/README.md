# French

# Semaine 1

## Cette semaine :
* Introduction à Pep8
* Instructions de base
* Instructions d'affichage et de saisie

## Théorie

### Workflow

Cette semaine, on voit les instructions de base de l'assembleur.

Concrètement le workflow est généralement le même quand on travaille à un aussi bas niveau, peu importe le langage d'assemblage avec lequel on se bat (PEP/8, x86-64, z80, etc.)

1. Load: On charge une valeur dans un registre
2. Work: On effectue des opérations sur le registre
3. Store: On décharge le registre à une place de la RAM
4. GOTO 1

Concrètement, chaque programme que vous allez écrire aura cette tête.

En PEP/8, pour l'étape une, on a 2 instructions possibles:

* LDr: Charge 16 bits
* LDBYTEr: Charge 8 bits

En assembleur, les types sont inexistants, la seule donnée que l'on peut utiliser est le byte.
Un byte peut représenter n'importe quoi, une valeur numérique, un char, etc.

C'est au programmeur de décider à quoi il a à faire.

NOTE: Le `r` du dessus fait référence à un registre, en PEP/8, on a uniquement A et X.

Pour l'étape deux, on peut avoir beaucoup de possibilités, mais présentement, on va se limiter à:

* ADDr: Ajoute la valeur d'une opérande à un registre
* SUBr: Retranche la valeur d'une opérande à un registre
* ANDr: ET binaire entre une opérande et un registre
* ORr: OU binaire entre une opérande et un registre
* NOT: NON binaire d'un registre
* NEGr: Négation (complément à deux) d'un registre

Quant à l'étape 3, on a les deux compléments de l'étape 1:

* STr: Décharge 16 bits du registre
* STBYTEr: Décharge 8 bits du registre

Note: N'oubliez jamais de terminer vos programmes par un `STOP`, ça vous évitera les mauvaises surprises :)

### Opérandes

On va parler de l'opérande.

Une opérande est le paramètre que l'on passe à une instruction.
Elle est composée de deux entités:

* Le spécificateur d'opérande
* Le mode d'adressage

Le spécificateur d'opérande est la partie qui suit l'instruction, on peut voir ça comme le "paramètre" de l'instruction.

Le spécificateur d'opérande peut se spécifier sous plusieurs formes:

* Nombre décimal
* Nombre hexadécimal
* Symbole
* Caractère

Peu importe ce que l'on utilise comme spécificateur d'opérande, toujours garder en tête que le résultat final est qu'il va se transformer en un nombre, visible dans le code objet du programme.

Le spécificateur d'opérande est finalement transformé en opérande après lecture du mode d'adressage.
C'est lui qui va déterminer la donnée finale envoyée à l'instruction, soyez sûrs de bien les comprendre, c'est souvent source de bug quand utilisé inadéquatement.

Présentement on va parler de deux modes seulement:

* i: Immédiat. Le spécificateur d'opérande est l'opérande elle-même, pas de traitement. i.e. `O = Spec`
* d: Direct. Le spécificateur d'opérande est une adresse et l'opérande sera la valeur contenue à cette adresse. i.e. `O = Mem[Spec]`

### Directives

Les directives sont des moyens de manipuler les données directement, elle ne sont pas censées représenter du code exécutable (mais c'est pas pour autant qu'elles ne peuvent pas l'être !).

Vous pouvez assigner des parties de la mémoire à un symbole, pour stocker des informations essentielles pour le fonctionnement de votre programme (Strings, variables, constantes, etc.)

En PEP/8, vous avez plusieurs directives, chacune ayant son utilité:

* .BLOCK n: Set `n` bytes avec pour valeur 0 à l'adresse où il est déclaré
* .BYTE n: Set 1 byte avec la valeur `n` à l'adresse où il est déclaré
* .WORD n: Set 2 bytes (1 mot mémoire) avec la valeur `n` à l'adresse où il est déclaré
* .END: Déclare la fin de l'assemblage, il est obligatoire en PEP/8 (sous peine d'un message d'erreur à l'assemblage)

L'utilisation de ces directives, en conjonction ou non avec un symbole, on pour effet de définir l'état de cellules mémoire à l'adresse où elles seront écrites.
.END est un cas spécial, il a une utilité purement sémantique, aucune répercussion n'est à prévoir dans la RAM (on le voit dans le code objet sous la forme `zz`).

Si on se réfère à la doc PEP/8, il y'a encore quelques directives, mais on en parlera plus tard, elles n'ont pas de réelle utilité présentement.

## Intro

### Intro 1: Modes d'adressage de base

Créez un programme PEP-8 avec un `WORD` initialisé à la valeur de votre choix.

Affichez sa valeur avec des `DECO` en `i`, puis en `d`.

Comprenez-vous les valeurs qui s'affichent à l'écran ?

### Intro 2: Byte vs. Word

Initialisez un `BYTE` et un `WORD` dans votre code aux valeurs de votre choix.

Essayez de charger leurs valeurs dans un registre à l'aide de `LDx` et `LDBYTEx`, puis observez leurs valeurs dans le débogueur.

Qu'observez-vous ?

### Intro 3: Strings

Déclarez une chaîne de caractères non terminée par un `\x00`.

En dessous, déclarez un `.BYTE` initialisé à la valeur 41.

Affichez la chaîne de caractères avec un `STRO`.

Qu'observez-vous ?

## Exercices

### Exercice 1 : Addition simple
On veut additionner 10 à un nombre saisi au clavier.

Exemple :

    5
    15

### Exercice 2 : Addition simple avec affichage de caractères
Le programme demande à l'utilisateur de saisir deux nombres puis fait l'addition.

Exemple :

    10
    5
    15

### Exercice 3 : 
On affiche le caractère saisi par l'utilisateur.

Exemple :

    a
    a

# English

# Week 1

## This week :
* Pep8 Introduction
* Basic instructions
* Input/Output instructions

## Intro

### Intro 1: Basic addressing modes

Write a simple PEP-8 program with a WORD symbol initialized with the value of your choice.

Print its value using the two addressing modes `i` and `d`.

Do you understand the values printed onscreen.

### Intro 2: Byte vs. Word

Initialize two symbols, one WORD and one BYTE with the values of your choice.

Load their values with LDx and LDBYTEx, observe their values in the debugger.

What can you see ?

### Intro 3: Strings

Declare a String non null-terminated (`x00`)

Below, declare a `.BYTE` initialized with value 41.

Print the String using STRO.

What can you see ?

## Exercices

### Exercice 1 : Simple addition

Add 10 to a user inputted number.

Exemple :

    5
    15

### Exercice 2 : Addition simple avec affichage de caractères

Add two user inputted numbers.

Exemple :

    10
    5
    15

### Exercice 3 : 

Print the character inputted by a user

Exemple :

    a
    a

