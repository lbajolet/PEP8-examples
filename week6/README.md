## Semaine 6

### Allocation Dynamique

Maintenant qu'on a vu les derniers modes d'adressage de PEP-8 et comment avoir des variables locales via la pile, on s'attaque au dernier morceau d'assembleur de la session: le tas! (En anglais: Heap)

Les objets sur le tas sont des données accessibles par tous, pour peu qu'ils aient une référence connue dans un cadre d'activation sur la pile.

C'est ici par exemple que les objets se retrouvent en Java à l'appel d'un `new`.

Avantage: le tas, c'est grand, et y'a pas de risque d'invalider les données situées là-bas contrairement à la pile ou les données ne sont valides qu'à l'intérieur du cadre d'activation de la fonction.

On va mettre dans le tas des données persistantes pour la durée de vie du programme comme des structures telles des maillons de liste chaînée, des noeuds d'arbre et autres joyeusetés.

Pour accéder à ces données en revanche, il faudra nécéssairement y accéder par référence, via `sf`, `sxf` ou `x` !

~~~asm
; Allocates `n` bytes on the Heap
;
; Params:
;	* Register A: `n` bytes to allocate
; Returns:
;	* Register X: Address of the allocated block
malloc:		LDX	heap_ptr, d
		ADDA	heap_ptr, d
		STA	heap_ptr, d
		RET0
heap_ptr:	.ADDRSS heap
heap:		.BYTE 0
~~~

Pour allouer de l'espace dans le tas, l'on utilisera `malloc`.
Vous devrez mettre ce morceau de code à la fin de votre programme.

Les structures de données peuvent être vues commes des tableaux hétérogènes.
Concrètement, il s'agit d'un tableau dont toutes les valeurs n'ont pas la même taille.

Exemple:

~~~C
struct A {
	char c;
	int j;
	int k;
}
~~~

Si on représente ça en mémoire avec des conventions à la Pep/8, ça donne un tableau contenant:

`|c|jh|jl|kh|kl|`

On accède à C avec un offset 0, j avec un offset 1 et k avec un offset 3.

## Exercices

### Exercice 1

Allouez un tableau dans le tas et remplissez-le de données (Int)  entrées par l'utilisateur.

~~~C
int main()
{
	int sz;
	scanf("%d", &sz);
	int* arr = malloc(sz * sizeof(int));
	int i;
	for(i = 0; i < sz; i ++) {
		int num;
		scanf("%d", &num);
		arr[i] = num;
	}
}
~~~

## Exercice 2

Affichez le contenu du tableau lu dans l'exercice 1.

## Exercice 3

Allouez une structure en mémoire pour qu'elle contienne un pointeur vers un autre élément de cettre structure et une donnée.

Ajoutez des fonctions pour accéder et modifier facilement à un de ses champs.

~~~C
typedef struct A A;

struct A {
	int value;
	A* other;
};

int get_val(A* obj)
{
	return obj->value;
}

A* get_other(A* obj)
{
	return obj->other;
}

int set_val(A* obj, int newval)
{
	obj->value = newval;
}

A* set_other(A* obj, A* other)
{
	obj->other = other;
}
~~~

## Exercice 4

En utilisant les fonctions développées en `3`, chaînez plusieurs instances de A et promenez vous dans la chaîne que vous aurez créé.

~~~C
int main()
{
	A* s = NULL;
	A* olds = s;
	int i;
	for(i = 0; i < 10; i++) {
		olds = s;
		s = malloc(sizeof(A));
		set_val(s, i);
		set_other(s, olds);
	}
	while(s != NULL) {
		printf("%d ", get_val(s));
		s = get_other(s);
	}
}
~~~
