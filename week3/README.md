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

~~~C
int main(int argc, char* argv[])
{
	int x[] = {9, 8, 7, 6, 5, 4, 3, 2, 1, 0};
	int xlen = 10;
	int swapped = 1;
	int i;

	while(swapped) {
		swapped = 0;
		for(i = 1; i < xlen; i++) {
			if(x[i] < x[i - 1]) {
				int tmp = x[i];
				x[i] = x[i - 1];
				x[i - 1] = tmp;
				swapped = 1;
			}
		}
	}

	for(i = 0; i < xlen; i++) { printf("%d ", x[i]); }
	printf("\n");
}
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
