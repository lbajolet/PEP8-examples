# French

# Semaine 3

Correction des exercices de la semaine 3, les sources sont disponibles dans le dossier courant.

## Théorie

L'accès indexé est un moyen efficace de travailler avec des tableaux en Pep/8.

Comme présenté dans la page des exercices, il agit en effectuant l'addition de la valeur actuelle du registre X et du spécificateur d'opérande donnée en paramètre.

~~~Pep-8
	LDA	spec, x
	; Mem[spec + X]
~~~

L'opération peut s'effectuer dans les deux sens, ainsi les deux codes suivants sont équivalents:

~~~Pep-8
main:	LDX	2, i
	DECO	arr, x ; OUT: 5

	LDX	arr, i
	DECO	2, x ;	OUT 5

arr:	.WORD	2
	.WORD	5
~~~

Les tableaux se déclarent de plusieurs façons, soit via une directive de `.BLOCK` pour les tableaux remplis au runtime, ou via une chaîne de directives pour ceux possédant des valeurs par défaut.

## Itération sur des tableaux

Idéalement, les tableaux sont itérés via des structures semblables au `for` loops.

### RAPPEL

Un `for` loop est composé de plusieurs parties:

* Un prologue, qui servira à initialiser son itérateur à la valeur de base
* Un passage de contrôle des bornes, pour vérifier que l'itérateur est bien valide
* Le corps du for loop
* Un epilogue qui incrémente l'itérateur avant de re-breaker vers le passage de contrôle

On va d'abord déterminer les bornes inférieures et supérieures de notre itérateur en fonction de la taille de notre tableau.

La borne inférieure est déterminée par la formule suivante :

` sizeof(element) * min_index`

La borne supérieure quant à elle, est déterminée par la formule suivante :

` sizeof(element) * max_index`

On peut ensuite contrôler l'avancée en incrémentant X de `sizeof(element)` à chaque épilogue de la boucle.

## Matrices

Les matrices sont composées de deux façons, soit comme des tableaux unidimensionnels, soit comme des tableaux de pointeurs.

Dans la première solution, chaque ligne représente un décalage de `sizeof(line length)` dans le tableau, après quoi, un décalage de `sizeof(element)` est appliqué entre chaque élément de la ligne.

La deuxième solution est composée d'une indirection vers la ligne souhaitée (elle-même un tableau unidimensionnel), puis chaque élément de la ligne est accédé via un décalage de `sizeof(element)`.

# English

# Week 3

Correction of the exercises of week 3, sources are available in the current folder.

## Theory

Indexed addressing is an efficient way in Pep/8 to work with arrays.

As introduced in the previous page, it works by adding the actual value of register X and the operand spacifier used in parameter.

~~~Pep-8
	LDA	spec, x
	; Mem[spec + X]
~~~

The operation can thus be done in both ways, as shown in the following code:

~~~Pep-8
main:	LDX	2, i
	DECO	arr, x ; OUT: 5

	LDX	arr, i
	DECO	2, x ;	OUT 5

arr:	.WORD	2
	.WORD	5
~~~

Arrays are declared by a variety of ways, either via a `.BLOCK` directive with the size of the array in bytes for runtime-filled arrays, or via a chain of directives for those which possess static values.

## Iterating on arrays

Ideally, arrays are to be iterated in an analoguous way to a `for` loop.

### REMINDER

A `for` loop has several statements in its composition:

* A prologue, which will serve as initializer for the iterator
* A control point, which will check that the iterator is still valid
* The body of the for loop
* An epilogue, incrementing the iterator before jumping to the control point

We first determine our minima and maxima values for our iterator, depending on the size of the array.

The minima is defined by this formula:

` sizeof(element) * min_index`

The maxima is analoguous to the minima:

` sizeof(element) * max_index`

We can then control the increment by adding `sizeof(element)` to register X on each epilogue of the loop.

## Matrices

Matrices are composed of either of two ways:

* One-dimensional array
* One array of pointers and a one-dimensional array per line

In the first solution, each line is represented by shifting `sizeof(line length)` in the array, after which another shift of `sizeof(element)` is applied between each element of the line.

The second option is composed by an indirection to the line, then each element is separated by a shit of size `sizeof(element)`.
