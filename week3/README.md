# French

# Semaine 3

Au programme:

* Adressage indexé (`x`)
* Tableaux
* Matrices
* Directive `.ADDRSS`

## Intro

### Adressage indexé

L'adressage indexé est un mode d'adressage standard de Pep/8. Il agit comme l'addition de l'opérande immédiate et du registre d'Index: `X`.

Ainsi, si l'on souhaite accéder à la donnée située à 5 octets du symbole `arr`, la marche à suivre est la suivante: on charge d'abord 5 dans X, puis on accède à `arr` avec le mode d'adressage `x`.

NOTE: L'opération peut être effectuée dans le sens contraire ! On peut charger `arr` immédiatement en X, puis accéder à 5 en `x`.

### Tableaux

Les tableaux sont des espaces de données contigües en mémoire.

Par abus de langage, l'on peut considérer que l'ensemble de la mémoire disponible est en soi un tableau de taille 2^16.

Il est possible en Pep/8 de "déclarer" des tableaux de plusieurs façons différentes.

Soit via la directive `.BLOCK` suivi de la taille (en octets) du tableau. Ce faisant, les données du tableau seront à 0.

Une autre possibilité pour les tableaux statiquement définis est d'utiliser des directives `.WORD` ou `.BYTE` dépendamment du type de données de notre tableau et de les chaîner pour obtenir un tableau de valeurs prédéfinies.

### Matrices

Les matrices quant à elles, peuvent être modélisées de deux façons:

* Un tableau unidimensionnel ou chaque ligne possède une longueur définie qui sera un décalage fixe pour accéder à la ligne suivante.
* Un tableau de pointeurs (adresses) qui seront eux-même des tableaux unidimensionnels.

Les exercices qui suivent servent à mettre en exergue ces deux façons de travailler avec des matrices.

### .ADDRSS

La directive .ADDRSS sert à déclarer un espace de données d'une taille de 16 bits qui contiendra spécifiquement l'adresse d'un autre symbole.

On l'utilise en écrivant `.ADDRSS symbol`. À l'endroit où le symbole est déclaré sera donc stocké l'adresse du symbole `symbol`.

## Exercices

### Exercice 1

Définissez un tableau de 10 entiers dans votre programme avec les valeurs de votre choix. Itérez sur ce tableau pour en afficher les valeurs une à une dans la sortie standard.

### Exercice 2

En utilisant le code de l'exercice 1 pour l'affichage, ajoutez une boucle de remplissage des données du tableau par l'utilisateur.

### Exercice 3

Triez ce tableau du plus petit au plus grand à l'aide d'un tri à bulles.

Pseudo-code Bubble Sort:

~~~nit

var x = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
var xlen = 10
var swapped = true

while swapped do
	swapped = false
	for i in [1 .. xlen[ do
		if x[i] < x[i - 1] then
			var tmp = x[i]
			x[i] = x[i - 1]
			x[i - 1] = tmp
			swapped = true
		end
	end
end

print x # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

~~~

## Exercice 4

Écrivez un programme au comportement analogue à un read_line (STRI).
Puis, réaffichez la ligne lue avec un STRO (n'oubliez pas la contrainte du `\x00`).

Seule limite: La ligne devra être de 100 caractères maximum.

Pseudo-code:

~~~nit

var str = new Array[Char](101)
var curr_c = chari
var pos = 0

while curr_c != '\n' and pos < 100 do
	str[pos] = curr_c
	pos += 1
	curr_c = chari
end

str[pos] = '\x00'

print str

~~~

## Exercice 5

Définissez une matice de 3 * 4 entiers de la première façon mentionnée plus haut.
Puis, affichez le contenu de la matrice ligne par ligne.

## Exercice 6

En vous appuyant sur le code de l'exercice 4, créez une matrice complémentaire à la première en inversant les lignes et les colonnes.
Affichez cette matrice.

Exemple:

~~~
0 1 2 3
4 5 6 7
8 9 1 2
~~~

=>

~~~
0 4 8
1 5 9
2 6 1
3 7 2
~~~

## Exercice 7

Définissez une matrice de la seconde façon proposée plus haut.
Affichez le contenu de cette matrice, ligne par ligne.

# English

# Week 3

This week:

* Indexed addressing (`x`)
* Array
* Matrices
* `.ADDRSS` directive

## Intro

### Indexed Addressing

Indexed addressing is a standard addressing mode of Pep/8. It acts as the addition of the operand specifier and the Index register `X`.

If we with to access the data located at 5 bytes starting from symbol `arr`, we need to load 5 into register `X`, then we access `arr` with addressing mode `x`.

NOTE: The operation can be done in reversed order. Such that if we load the address of `arr` into `X`, then try to access 5 with `x` addressing mode, it will do the exact same operation.

### Arrays

Arrays are contiguous data stored in memory.

We can consider the whole RAM of the Pep/8 simulator as a gigantic array of length 2^16.

Arrays can be declared in Pep/8 using two different methods:

* Either using the `.BLOCK` directive for arrays whose values default to 0.
* Either using `.BYTE` or `.WORD` directives in chain, for arrays whose values are specified as assembly-time.

### Matrices

Matrices can be defined by two differents manners:

* As one single-dimension array in which lines of the matrix have a fixed-length, such that to access the next line, an offset is known in advance.
* As one single-dimension array containing pointers (addresses) to single-dimension arrays which will contain the data of each line.

### .ADDRSS

The `.ADDRSS` directive is used to declare a 16-bit data (word-sized) which will contain the address of another symbol.

It is defined as `.ADDRSS symbol`, such that where it is defined, the address of symbol `symbol` will be stored.

## Exercises

### Exercise 1

Define an array of 10 integers in your program, and initialize them at the value of your choice. Iterate on the array to print each value in standard output.

### Exercise 2

Using the code you wrote in exercise 1, add a loop to fill-in data in the array from the user input.

### Exercise 3

Sort this array in ascending order using a Bubble sort.

Bubble Sort pseudo-code:

~~~nit

var x = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
var xlen = 10
var swapped = true

while swapped do
	swapped = false
	for i in [1 .. xlen[ do
		if x[i] < x[i - 1] then
			var tmp = x[i]
			x[i] = x[i - 1]
			x[i - 1] = tmp
			swapped = true
		end
	end
end

print x # => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

~~~

## Exercise 4

Write a program with a behaviour similar to read_line (STRI).
Then, print the line you read using STRO (do not forget to null-terminate your String).

Limit: The line can not exceed 100 characters in length.

Pseudo-code:

~~~nit

var str = new Array[Char](101)
var curr_c = chari
var pos = 0

while curr_c != '\n' and pos < 100 do
	str[pos] = curr_c
	pos += 1
	curr_c = chari
end

str[pos] = '\x00'

print str

~~~

## Exercise 5

Define a 3 * 4 matrix, using the first method mentionned earlier.
Then, print its content line by line.

## Exercise 6

Using the code in exercise 4, create a complementary matrix to the first one by inverting lines and columns.
Then, print this matrix.

Example:

~~~
0 1 2 3
4 5 6 7
8 9 1 2
~~~

=>

~~~
0 4 8
1 5 9
2 6 1
3 7 2
~~~

## Exercise 7

Define a matrix using the second method.
Then, print its content line by line.
