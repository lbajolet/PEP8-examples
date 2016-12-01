## Semaine 7

### IEEE-754 Représentation binaire des nombres à virgule flottante

On attaque une partie théorique cette semaine, PEP-8 ne supportant pas d'instructions pour les nombres à virgule flottante.

IEEE-754 est la norme définissant la représentation des nombres flottants, la première version date de 1985, la dernière révision, de 2008.

Sur le contenu, les fondements n'ont pas changé, il s'agit plus d'actualisations qu'autre chose, dans la mesure ou on voit la base, on sera pas impactés par les changements entre les versions.

Chaque nombre flottant est représenté selon la formule suivante `(−1)s × c × bq`

* `s`: Signe, un bit 0 ou 1
* `c`: Significande, aussi appelée mantisse (y'a apparemment une différence entre les deux notions, les mathématiciens râlent quand on parle de mantisse, mais vu qu'on râtisse large, les deux définitions sont acceptées)
* `q`: Exposant
* `b`: Base

Pour le cours on s'intéressera uniquement aux nombres à base 2.

IEEE-754 définit plusieurs précisions pour les nombres flottants:

* 16 bits: `sqqq qqcc cccc cccc`, appelé selon le standard `half-precision` ou `binary16`
* 32 bits: `sqqq qqqq qccc cccc cccc cccc cccc cccc`, `single-precision` ou `binary32`
* 64 bits: `sqqq qqqq qqqq cccc cccc cccc cccc cccc cccc cccc cccc cccc cccc cccc cccc cccc`, `double-precision` ou `binary64`
* 128 bits: `quadruple-precision` ou `binary128`

### Méthode de conversion décimal/binaire

Pour convertir de décimal vers binaire, on va y aller en plusieurs étapes.

#### Étape 1: Conversion de la partie entière

Pour convertir la partie entière, on va procéder de la façon habituelle en utilisant la méthode de votre choix, soit en divisant successivement par deux, soit via des soustractions de puissances de deux successives.

#### Étape 2: Conversion de la partie fractionnaire

La partie fractionnaire se convertit d'une façon différente, au lieu de diviser, on va y aller par multiplications successives.

On multiplie la partie fractionnaire courante par 2, la partie entière résultante sera apposée à la représentation binaire de la partie fractionnaire.
La partie fractionnaire résultante sera réutilisée pour refaire l'opération.
Lorsque la partie fractionnaire est égale à 0 ou que l'on a épuisé la précision de la mantisse, on arrête le processus.

#### Étape 3: Calcul de l'exposant

On met bout à bout les deux parties avec la virgule entre elles.
On va décaler la virgule pour qu'elle se retrouve derrière le premier bit significatif.

En cas de décalage vers la gauche, on aura un exposant positif, sinon, un exposant négatif.

Le nombre binaire résultant du décalage sera la mantisse (ou significande, dépendamment de comment vous voulez l'appeler)

Avec cet exposant, on va y apposer le biais, qui va dépendre de la précision (F pour demi-précision, 7F pour simple-précision, etc.)

On prend donc l'exposant que l'on convertit en hexadécimal, puis on lui ajoute le biais.

Le résultat sera l'exposant en binaire.

#### Étape 4: Construction du nombre en binaire

On concatène simplement le binaire de chaque entité dans l'ordre précisé par la norme.

Bit de signe + Exposant (binaire) + Mantisse/Significande.

#### Exemple

On va supposer qu'on convertit le chiffre en flottant simple-précision.

Considérons le nombre 12.375.

On va d'abord convertir 12 en binaire =>

`2^3 12 - 8 = 4` -> 1
`2^2  4 - 4 = 0` -> 1
`2^1 Non-fit   ` -> 0
`2^0 Non-fit   ` -> 0

12(10) = 1100(2)

Puis, on passe à la partie fractionnaire, .375

`.375 * 2 = 0.75` -> 0
`.75  * 2 = 1.5`  -> 1
`.5   * 2 = 1.0`  -> 1

.375(10) = 011 (2)

On se retrouve avec le nombre 1100.011

On décale la virgule de 3 bits vers la gauche pour arriver au premier bit significatif du nombre => 1.100011

La Mantisse/Significande sera donc 100011 (le premier 1 est implicite selon la norme).

On appose le biais à l'exposant: 3 + 7F => 82(16)

Maintenant que tout est calculé, on peut construire le nombre.

Le bit de signe est 0 (chiffre positif)

Exposant 82(16) => 1000 0010(2)

Mantisse/Significande => 100011(2)

Résultat: `0100 0001 0100 0110 0000 0000 0000 0000`

### Méthode de conversion binaire/décimal

La conversion de binaire vers décimal est assez simple quand on comprend la partie de décimal vers binaire puisqu'il s'agit de refaire l'opération en sens inverse.

On commence par isoler chaque partie de notre chiffre en binaire.

Le signe est toujours le bit de poids fort.

L'exposant est n bits, décrit par le standard.

Le reste sera la mantisse.

On commence par l'exposant puisqu'il est le plus important pour la suite.

On va lui soustraire le biais de la précision choisie, ce qui nous donne l'exposant original `q`.

On concatène "1," et la mantisse d'un côté.

Après ça, on va décaler la virgule de q bits dans la mantisse.

Puis, on procède à l'opération de conversion binaire -> décimal.

Pour la partie entière, la procédure reste la même que d'ordinaire.

La partie fractionnaire est calculée d'une façon similaire à partir des puissances de deux négatives.

On prend la somme des digits à 1 avec la puissance de deux correspondante pour obtenir la valeur fractionnaire en base 10.

#### Exemple

On prend la représentation en simple-précision: `0100 0001 0100 0110 0000 0000 0000 0000`

Le signe est à 0, on a donc un chiffre positif

L'exposant est 1000 0010, en hexa -> 82

On lui retire le biais de la précision donnée: 7F => 82 - 7F = 3

En prenant la mantisse `100 0110 0000 0000 0000 0000`, on lui appose "1," => `1,100 0110 0000 0000 0000 0000`

On décale la virgule de 3 bits: `1100,0110 0000 0000 0000 0000`

En prenant la partie entière, on fait l'addition: 2^3 + 2^2 => 8 + 4 = 12

La partie fractionnaire est effectuée de façon similaire: 2^-2 + 2^-3 = .25 + .125 = .375

On concatène le tout => `12.375`

### Valeurs spécifiques

Le standard IEEE-754 définit des valeurs spécifiques pour certains exposants.

Les valeurs 0 et max (FF pour binary-32 par exemple) sont des valeurs spécifiques d'exposants.

Si on prend la valeur 0 pour l'exposant, et que la significande est à 0 également, le chiffre résultant est un 0 ou -0 (et oui, ça existe en IEEE-754).

Dans le cas où la significande est différente de 0, on a affaire à un nombre dénormalisé.
Sa valeur doit être calculée d'une autre façon, la formule habituelle ne s'appliquant plus.
Concrètement, le calcul à faire est `(-1)s * c * 2^(-q + 1)`

Si l'exposant est à sa valeur maximale, on a encore accès à deux possiblités.

Si la significande est 0, il s'agit de +/- infini.

Si la significande est autre que 0, il s'agit d'un NaN (Not a Number).
NaN est une notion spéciale définie dans le standard IEEE-754. Il s'agit de tout nombre non représentable à l'aide de la norme (ex: nombres complexes).

## Exercices

### Exercice 1

Convertissez en binaire simple-précision le nombre `1664.125`

### Exercice 2

Convertissez en décimal le nombre `0100 0010 1111 1010 0100 0000 0000 0000`

### Exercice 3

Convertissez en décimal le nombre `1111 1111 1000 0000 0000 0000 0000 0000`

### Exercice 4

Convertissez en binaire demi-précision le nombre 125.25

### Exercice 5

Convertissez en décimal le nombre `0100 1001 0110 0000`

### Exercice 6

Convertissez en binaire simple-précision le nombre 0.5
