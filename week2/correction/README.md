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

