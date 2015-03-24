# French

## Semaine 5

### Sous-programmes (la revanche)

Pour continuer sur le thème de la semaine passée, on continue à parler de sous-programmes cette semaine.

La principale différence: plus de magie.

Un CALL fait deux choses: il empile l'adresse de retour, puis il branche sur l'adresse passée en oprérande.
RETn quant à lui, permet de retourner au point d'appel lors de la fin de l'éxécution d'une fonction.
Le n mentionné dans le RET permet de dépiler n octets avant de retourner au point d'appel.

Si RETn existe avec une partie modulaire, c'est parce qu'il est possible d'empiler des données localement.
C'est le principe derrière les variables locales des langages de programmation de haut-niveau.
Plutôt que de les déclarer avec un symbole dans la RAM directement (à l'assemblage), on les alloue dans la pile.

Pour ça, il faut premièrement "réserver" l'espace sur la pile pour recevoir nos données.
On va donc bouger le pointeur de pile avec `SUBSP`, puis la taille (en octets) des variables qu'on veut stocker.
NOTE: Les octets réservés ne sont pas remis à 0 !

~~~Pep8
SUBSP	n, i ; Allocates n bytes on the stack
~~~

Derrière, il faudra remplir les données allouées sur la pile.
Pour ça, on devra utiliser les modes d'adressage sur la pile: `s`, `sx`, `sf`, `sxf`.

`s`: sur la pile; Le spécificateur d'opérande est un décalage par rapport à SP. => Mem[SP + Spec]
`sx`: indexé sur la pile; Le spécificateur d'opérande est un décalage par rapport à SP auquel on ajoute la valeur du registre X pour trouver l'adresse effective. => Mem[SP + Spec + X]
`sf`: indirect sur la pile; Le spécificateur d'opérande est un décalage par rapport à SP, et à cette adresse, l'on va considérer que la valeur est un pointeur vers une ressource qui sera l'opérande. => Mem[Mem[SP + Spec]]
`sxf`: indirect indexé sur la pile; Le spécificateur d'opérande est un décalage par rapport à SP, à cette adresse est un pointeur vers une ressource, à ce pointeur on ajoute la valeur de X pour avoir l'opérande. Mem[Mem[SP + Spec] + X]

On va donc utiliser les variables locales jusqu'a la sortie de la fonction actuelle, à l'épilogue de la fonction, il est important de ne jamais oublier la phase de désallocation des variables locales, sans quoi le programme va brancher n'importe où.
Pour ça, utilisez soit `ADDSP` suivi de la taille à désallouer (en octets), soit un `RETn` pour désallouer au retour.
Attention cependant, RETn est limité à 7 octets maximum, si vous allouez plus, vous devrez utiliser `ADDSP` pour désallouer vos données.

Donc, pour accéder à vos variables, vous devrez utiliser des décalages numériques.
Pour certaines fonctions, vous aurez potentiellement beaucoup de variables locales, les décalages deviennent vite ennuyants voire tompeurs à utiliser, et risquent de provoquer des bugs difficiles à tracer et à corriger.

Pour plus de clareté donc, vous pouvez utiliser `.EQUATE` pour attribuer un décalage à vos variables.
.EQUATE est une directive spéciale dans la mesure où elle ne sera pas présente dans le code objet, il s'agit juste d'un alias statiquevers une valeur de votre choix.
Pour ceux qui ont déjà été en contact (volontaire ou forcé) avec du C, c'est un peu l'équivalent d'une macro `#define`.

Exemple:

~~~Pep8
; Main, multiplies two integers
main:	SUBSP	2, i
	LDA	4, i
	LDX	5, i
	CALL	mul
	STA	prod, s
	DECO	prod, s
	ADDSP	2, i	
	STOP
; Product of the multiplication
prod:	.EQUATE 2

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
mul:	SUBSP	2, i
	STA	inc, s
	LDA	0, i
mullp:	CPX	0, i
	BRLE	mulout
	ADDA	inc, s
	SUBX	1, i
	BR	mullp
mulout:	RET2
; Increment
inc:	.EQUATE 2
~~~

## Exercices

### Exercice 1

Codez une fonction qui calcule le nombre de fibonacci passé en paramètre.

Voici le pseudo-code:

~~~nit
fun fib(i: Int): Int do
	if i < 2 then return i
	return fib(i - 1) + fib(i - 2)
end
~~~

### Exercice 2

Codez une fonction qui effectue la division de deux nombres.

Vous passerez les paramètres via la pile, et les retours seront également sur la pile.
Retournez les valeurs du quotient et du reste à la fois.

Pseudo-code:

~~~nit
# This looks cool eh ?
# Good luck doing it in a Java-like language, where only one return can be expressed in a function :)
fun div(dividend, divider: Int): (Int, Int) do
	var quot = 0
	while dividend >= divider do
		dividend -= divider
		quot += 1
	end
	return (quot, dividend)
end
~~~

### Exercice 3

Codez une fonction qui va effectuer une recherche dichotomique d'un élément dans un tableau trié.

Le tableau sera alloué sur la pile et passé en paramètre via son adresse (pour passer l'adresse, utilisez l'instruction MOVSPA suivi du décalage).

Pseudo-code:

~~~C
int binary_search(int* data, int toFind, int start, int end){

   int mid = start + (end - start)/2;

   if (start > end)
      return -1;
   else if (data[mid] == toFind)
      return mid;
   else if (data[mid] > toFind)
      return binary_search(data, toFind, start, mid-1);
   else
      return binary_search(data, toFind, mid+1, end);
}
~~~

### Exercice 4

Dans la même veine que l'exercice d'avant, codez un quicksort sur un tableau alloué sur la pile.

Pseudo-code:

~~~nit
fun qsort(arr: Array[Int], from, to: Int) do
	if from < to then return
	var p = part(arr, from, to)
	qsort(arr, from, p - 1)
	qsort(arr, p + 1, to)
end

fun part(arr: Array[Int], from, to): Int do
	var st_index = from
	var pival = arr[to]
	for i in [from .. to[ do
		if arr[i] < pival then
			swap(arr, i, st_index)
			st_index += 1
		end
	end
	swap(arr, st_index, to)
	return st_index
end

fun swap(arr: Array[Int], from, to: Int) do
	var tmp = arr[from]
	arr[from] = arr[to]
	arr[to] = tmp
end
~~~
