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

Une fois settés, les flags vont déterminer si un branchement est à effectuer ou non, il ne reste plus qu'a utiliser BR(L|G)(E|T) pour brancher ou non votre programme.

Attention cependant, CPr n'est pas le seul à changer les valeurs des flags, un LDr ou n'importe quelle autre instruction touchant les valeurs d'un registre peut changer les flags.

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
