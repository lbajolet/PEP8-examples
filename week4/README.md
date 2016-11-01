## Semaine 4

### Sous-programmes

Comme dans les langages de haut-niveau, il est possible d'écrire des sous-programmes en Pep/8, la convention d'appel en revanche change un peu des langages de haut niveau.

En Pep/8, deux instructions sont disponibles pour travailler avec des sous-programmes : `CALL` et `RET0`.

`CALL` comme son nom l'indique, sert à appeler un sous-programme. Il fonctionne d'une façon analogue à BR, on lui donne un symbole ou une adresse, il va effectuer le branchement et garder un moyen de revenir au flux d'exécution avant l'appel.

On discutera plus en détail de quoi et comment les informations sont gardées ultérieurement.

`RET0` quant à lui sert lorsque la fonction a fini d'éxécuter à retourner au point d'appel. Il est donc essentiel de l'appeler à la terminaison de la fonction pour revenir au lieu d'appel et continuer normalement le programme.

NOTE: Il est possible de passer autre chose que 0 comme paramètre à RET, en effet, RET peut être appelé avec des valeurs de 0 à 7, on discutera de pourquoi plus tard dans le cours.

Pour passer des paramètres, on se contentera pour le moment de passer tout via des registres ou des variables globales. Par conséquent, la récursion est présentement impossible !

Exemple de sous programme:

~~~Pep8
; Main, multiplies two integers
main:	LDA	4, i
	LDX	5, i
	CALL	mul
	STA	prod, d
	DECO	prod, d
	STOP
; Product of the multiplication
prod:	.BLOCK	2

; Multiply sub-program
; NOTE: Only works with positive integers
;
; Parameters:
;	Register A: Multiplicand
;	Register X: Multiplier
;
; Return:
;	Register A: Product
;
; Symbol `inc` can and will be mutated and is
; supposed to be private to this function.
mul:	STA	inc, d
	LDA	0, i
mullp:	CPX	0, i
	BRLE	mulout
	ADDA	inc, d
	SUBX	1, i
	BR	mullp
mulout:	RET0
; Increment, is equal to the multiplicand
inc:	.BLOCK	2
~~~

## Exercices

### Exercice 1

Vous devez faire une fonction permettant de renseigner le contenu d'un tableau par un utilisateur.
Le tableau contiendra 5 entiers.

Exemple:

~~~
Please enter 5 numbers:
5
4
3
2
1
Done.
~~~

### Exercice 2

Utilisez le code de l'exercice 1 pour renseigner un tableau de 5 entiers.
Faites une fonction permettant d'afficher son contenu.

Exemple:

~~~
5, 4, 3, 2, 1
~~~

### Exercice 3

Ajoutez un paramètre pour renseigner la taille du tableau à vos deux fonctions.

### Exercice 4

Créez une fonction permettant d'accéder à un index (`x`, `y`) d'une matrice.
Vous pouvez représenter la matrice de la façon dont vous le voulez, soit à l'aide d'un tableau unidimensionnel, soit à l'aide d'un tableau de pointeurs.

### Exercice 5

Créez une fonction pour lire une chaîne de caractères de l'entrée standard et la stocker dans un tableau passé en paramètre.
Vous passerez en paramètre également un nombre maximal de caractères à lire.

La fonction retournera le nombre de caractères lus.

### Exercice 6

Un carré magique est un carré possèdant plusieurs propriétés:

* La somme des chiffres de sa diagonale sont un point de référence => `diagsum`
* La somme des éléments de chaque ligne doit être égale à `diagsum`
* La somme des éléments de chaque colonne doit être égale à `diagsum`
* La somme des éléments de l'anti-diagonale doit être égale à `diagsum`

On vous demande dans cet exercice de vérifier la validité d'un carré magique.

Vous devrez afficher les contrevenants à la règle en utilisant un système de numérotation:

* L'anti-diagonale sera numérotée 0
* Les colonnes seront identifiées par un entier négatif, commençant à -1 et finissant par -n
* Les lignes seront identifiées par un entier positif, commençant à 1 et finissant par n

Affichez les potentiels contrevenants dans l'ordre croissant.

### Exercice 7

Brainfuck est un langage ésotérique, il est conçu pour être difficile à écrire par un humain.

En revanche, l'extrême simplicité du modèle mémoire et des instructions en font un langage facile à interpréter.

On vous demande ici d'écrire un interpréteur pour le langage.

Voici les spécifications de l'interpréteur:

* La mémoire (données) est composée d'un tableau de n bytes
* Un pointeur d'instruction servira à pointer sur la prochaine instruction à exécuter
* Un pointeur de données servira à pointer sur la case actuelle dans les données
* Les deux pointeurs commencent à 0
* Le programme est une chaîne de caractères

Spécification du langage lui-même:
* `>` : Incrémente le pointeur de données
* `<` : Décrémente le pointeur de données
* `+` : Incrémente la valeur de la case actuelle
* `-` : Décrémente la valeur de la case actuelle
* `[` : Saute au `]` correspondant si la case actuelle vaut 0
* `]` : Saute au `[` correspondant si la case actuelle ne vaut pas 0
* `.` : Affiche le caractère correspondant à la valeur de la case actuelle
* `,` : Saisie d'un caractère et stockage dans la case actuelle
* Tout caractère autre que ceux cités précédemment sont considérés comme des commentaires.

Exemple:

~~~
Programme : ++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.

Output: Hello World!
~~~
