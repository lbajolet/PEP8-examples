# Semaine 4

Correction des exercices de la semaine 4, les sources sont disponibles dans le dossier courant.

## Théorie

Les sous-programmes fonctionnent d'une façon similaire à des branchements non conditionnels.
La seule différence étant le souvenir du callsite et la possibilité de retourner au callsite.

En pratique, ce qui se passe lors d'un appel de fonction en Pep/8 est que l'adresse de retour de la fonction est sauvegardée sur la pile, permettant le retour au callsite à la fin de l'exécution d'une fonction.

L'information stockée sur la pile est bien l'adresse de l'instruction qui suit le CALL et non le CALL lui-même (ce qui est mieux, vu qu'on se ramasserait vite en récursion sinon).

Ceci s'explique à cause du cycle de l'UCT.

Pour rappel, l'UCT fonctionne en 4 étapes:

* Fetch: On récupère le bytecode de l'instruction courante
* Decode: On décode le bytecode pour déterminer l'action à effectuer
* Increment: On incrémente le compteur ordinal
* Execute: On exécute l'instruction courante

Par conséquent, au moment d'exécuter l'instruction CALL, le compteur ordinal est déjà incrémenté, donc la valeur empilée est l'adresse de l'instruction après le CALL.

RET0 permet donc de retourner au callsite en dépilant l'adresse de retour et en settant le compteur ordinal à la valeur présente au top de la pile.

Il est possible de passer d'autres valeurs que 0 à RET, la valeur qu'on passe permet de dépiler n octets en plus du compteur ordinal.
On peut donc dépiler les valeurs allouées localement sur la pile à l'aide du RETn.

Cependant, l'allocation sur la pile est au programme de la semaine prochaine, on pratiquera donc ça à ce moment-là !
