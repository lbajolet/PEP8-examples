# French

# Semaine 2

Correction des exercices de la semaine 2, les sources sont disponibles dans le dossier courant.

## Théorie

Les branchements de Pep/8 s'effectuent en deux parties.

Une première est l'initialisation des Flags NZVC, qui seront utilisés par les instructions de branchement en tant que telles pour déterminer si un jump est à effectuer ou non.

Pour ce faire, chargez la valeur de l'opérande gauche (LDr ou LDBYTEr) dans le registre de votre choix.

Puis, comparez la valeur à l'aide de CPr.

En mémoire, l'opération est effectuée comme une soustraction:

~~~
Register r - CPA operand
~~~

Dépendamment du résultat de l'opération, les FLAGS vont être settés à `true` (`1`) ou `false` (`0`).

## Boucles

Les boucles sont juste des cas spéciaux de branchements dans lesquels le corps de la boucle va être suivi d'un branchement non-conditionnel au début de votre boucle.

Dépendamment de la structure de haut-niveau à partir de laquelle vous basez votre code, la condition va être testée au début ou à la fin de la boucle.

Pour voir des exemples de boucles, référez-vous aux exercices 6+ et à leurs corrections pour des explications plus détaillées.

## Manipulation de Strings

Vous avez pu vous en rendre compte, Pep/8 ne possède pas de commande STRI.

C'est dommage, mais justifié, la fonction ne pouvant pas être primitive, elle devra être définie par l'utilisateur, nous ferons des exercices la dessus plus tard dans la session.

Fait que si je veux lire une String, ça se passe comment ?

Soit on définit notre propre STRI avec un tableau de chars, ce qui, présentement, est pas vraiment possible vu que l'adressage indexé est encore un mystère (ça va pas durer longtemps, croyez-moi :) )

Donc, seule chose qu'on puisse faire dans ce cas-là, c'est lire l'entrée standard caractère par caractère avec des CHARI dans une boucle.

On choisira un délimiteur de fin de chaîne en fonction de ce qu'on cherche ('\n' ou ' ' par exemple).

`exo8` est un bon exemple de lecture char par char, vous êtes encouragés à faire l'exercice et à regarder la solution.

NOTE: Vu qu'on est sur des chars et de la comparaison, référez-vous à `exo4` pour la comparaison de caractères de façon sure !

# English

# Week 2

Correction of the exercises of week 2, sources are available in the current folder.

## Theory

Pep/8 branch instructions are composed of two parts.

One is the initialization of NZVC flags, which will be used by branching instructions to determine whether or not a jump is necessary.

To do so, charge the left operand (LDr or LDBYTEr) in the register of your choice.

Then compare it using CPr.

In memory, the operation happening is a simple substraction:

~~~
Register r - CPA operand
~~~

Depending of the result of the operation, FLAGS will be accordingly set to `true` (`1`) or `false` (`0`)

## Loops

A loop is just a special case of branching in which the execution of the code is followed by a non-conditional branch to the top of the loop.

Depending of the high-level structure you are basing on, the testing for the condition will be done either at the start of at the end of the loop.

To see examples of loops, check exercises 6+ and their correction for explanations.

## Handling strings

As you may have noticed, Pep/8 does not have a STRI kind of command built-in.

This is unfortunate, but completely justified as it cannot be a primitive-level function, but a user-defined one, which we'll do later as exercises with the material we learn during the course.

So what if I do want to read a String for use in a program ?

Either we define our own STRI with an array of chars, which is something that, at this point, we will not do because indexed access is still a mystery (it won't be for long, trust me :) )

Now, what we can do is use CHARI in a loop to read an input string char by char and use a delimiter ('\n' or ' ' for instance) for the end of the string we are reading.

`exo8` is such an example of reading a String, the parsing will stop when a line-feed is encountered or when a non-letter character is read, therefore excluding lines with non US-ASCII letters.

NOTE: Since we're dealing with chars and CPr, do make sure to check `exo4` for fail-safe char comparisons !
