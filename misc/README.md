# French

## Misc

Ce dossier contiendra des programmes d'exemple, il sera rempli au fur et à mesure des questions des étudiants et étudiantes sur la matière du cours.

Les programmes d'exemple contiendront des explications sur le code écrit.

## Comportement de base de l'assembleur

Une instruction en assembleur est composée de plusieurs parties.

Au niveau assembleur, une instruction est composée de sa mnémonique (nom de l'instruction), suivie d'un spécificateur d'opérande et de son mode d'adressage.
On notera que le spécificateur d'opérande n'est pas obligatoire, certaines instructions ne nécessitent pas que l'on leur spécifie une opérande et un mode d'adressage.

On les trouve généralement sous deux formes:

~~~Pep8
	MNMN Spec, addr
	MNMN
~~~

Au niveau du code objet en revanche, est la ou la magie s'opère.

Chaque symbole défini dans votre programme est transformé en sa représentation objet: une adresse.
Chaque instruction assembleur est transformée en sa contrepartie: la mnémonique est transformée en une valeur d'un octet, et le spécificateur d'opérande en deux octets.

La forme de chaque instruction dépend de l'opcode (operation code) et de la combinaison de l'information du registre et du mode d'adressage.

L'information de registre est codée sur 1 bit, celle du mode d'adressage sur 1 ou 3 bits.

## Modes d'adressage

Les modes d'adressage sont une partie importante de la programmation en assembleur en Pep/8.

Chaque instruction est composée de deux parties au niveau du code objet; l'instruction en elle-même (1 octet), le spécificateur d'opérande (2 octets), pas forcément nécessaire.

Une instruction peut recevoir un mode d'adressage, qui va déterminer le comportement à adopter vis-à-vis du spécificateur d'opérande.

Les modes d'adressage sont définis comme tels:

* i: Immédiat, le spécificateur d'opérande est envoyé tel-quel à l'instruction. => Operand = `Spec`
* d: Direct, le spécificateur d'opérande est considéré comme une adresse dans la mémoire qui contiendra la valeur qui servira d'opérande à l'instruction. => Operand = `Mem[Spec]`
* x: Indexé, le spécificateur d'opérande contient un décalage qui sera ajouté à la valeur actuelle du registre X pour déterminer l'adresse à laquelle se trouve l'opérande à envoyer. => Operand = `Mem[Spec + X]`
* n: Indirect, le spécificateur d'opérande est considéré comme une adresse, à cette adresse, la valeur contenue est également considéré comme une adresse, et c'est à cette adresse que se trouve l'opérande qui sera utilisée pour l'instruction. => Operand = `Mem[Mem[Spec]]`
* s: Pile: le spécificateur d'opérande est un décalage par rapport au pointeur de début de pile, puisque la pile est elle aussi contenue dans la RAM, il s'agit d'une opération similaire au `x`, mais avec une base indépendante de la valeur de X, mais dépendante de la valeur actuelle de SP. => Operand = `Mem[SP + Spec]`
* sf: Indirect sur la Pile, le spécificateur d'opérande est un décalage par rapport au pointeur de début de pile, a cette adresse est une valeur qui sera considérée comme une adresse, et l'adresse pointée contient la valeur qui sera envoyée comme opérande à l'instruction. => Operand = `Mem[Mem[SP + Spec]]`
* sx: Indexé sur la Pile, le spécificateur d'opérande est un décalage par rapport au pointeur de début de pile, à ce décalage sera ajouté la valeur actuelle du registre X. Le résultat de cette addition sera l'adresse à laquelle la valeur à envoyer comme opérande de l'instruction est située. => Operand = `Mem[SP + Spec + X]`
* sxf: Indirect sur la Pile Indexé: le mode d'adressage final, il s'agit d'une combinaison entre `s`, `n` et `x`. Le spécificateur d'opérande est un décalage par rapport au pointeur de début de pile, à cet endroit est situé ce qui sera considéré comme une adresse. A cette adresse, on ajoute la valeur actuelle du registre X. Cette adresse finale sera l'endroit où est située l'opérande de l'instruction courante. => Operand = `Mem[Mem[SP + Spec] + X]`

Plusieurs instructions de Pep/8 ne possèdent pas d'opérandes: STOP, RETTR, MOVFLGA, MOVSPA, RETx, NOPx, NOTr, NEGr, ASLr, ASRr, RORr, ROLr.

# English

## Misc

This folder will contain sample programs, it will be completed little at a time, depending on the questions of the students about the subject of the course.

The programs available here will contain explanations about the code.

## Basic assembly behaviour

An assembly instruction is composed of several parts.

At assembly-level, an instruction has a mnemonic (instruction name), followed by an operand specifier (later referred to as `Spec`) and its adressing mode.
Note that the operand specifier is not always necessary, and some instructions do not require the operand/addressing mode combo.

It is generally presented on either of the two forms:

~~~Pep8
	MNMN Spec, addr
	MNMN
~~~

On the object-code level however, is where the magic happens.

Each symbol declared in your program is transformed into its object-level representation: an address.
Each assembly instruction is transformed into its counterpart: the mnemonic is transformed into a byte, the operand specifier into two bytes.

The form of each instruction is dependent of the signature of the opcode and eventually a combination of register field and addressing mode.

The register field is one bit long and the addressing mode is either 1 or 3 bits long, depending on the instruction.

## About addressing modes

Addressing modes is an important component of assembly programming in Pep/8.

Basically, every instruction written in Pep/8 is composed of several parts at object-code level; the instruction (1 byte) and the operand specifier (2 bytes, unnecessary for some instructions).

Each Pep/8 instruction might receive an addressing mode, which will declare what to do with the operand specifier. However, some instructions cannot take any addressing mode, we'll go through this later.

Addressing modes are defined in the following manner:

* i: Immediate, the operand specifier is sent as operand to the instruction. => Operand = `Spec`
* d: Direct, the operand specifier is considered to be an address in memory which will contain the value to be sent as operand to the instruction. => Operand = `Mem[Spec]`
* x: Indexed, the operand specifier is added to the current value of register X to point to an address in memory, where the value to be sent to the instruction is stored. => Operand = `Mem[Spec + X]`
* n: Indirect, the operand specifier is considered to be an address, at which place is a value that will be considered as an address too, the final operand sent to the instruction will then be the value contained at the address retrieved last. => Operand = `Mem[Mem[Spec]]`
* s: Stack, the operand specifier is relative to the top stack pointer. Since the stack is stored on RAM, it will be an operation akin to x, except the addition will be SP + operand specifier. => Operand = `Mem[SP + Spec]`
* sf: Stack-Indirect, the operand specifier is relative to SP and points to what will be considered as an address to another place in RAM, where the value will be retrieved and passed as operand to the instruction. => Operand = `Mem[Mem[SP + Spec]]`
* sx: Stack-Indexed, in this case, the behaviour is akin to `s` as the address accessed will be on the stack, however the final address will be the one at SP + `spec` + the current value of register X, the value contained at this address will be the operand of the instruction. => Operand = `Mem[SP + X + Spec]`
* sxf: Stack-Indirect-Indexed, the final addressing mode, it is a combination of `s`, `n` and `x`. What it does is it takes the value contained in stack at an offset of `spec`, treats it as an address, then it adds the current value of register X to this address to determine the location of the value to retrieve in RAM, and send it as operand to the instruction. => Operand = `Mem[Mem[SP + Spec] + X]`

Several basic instructions of Pep/8 do not have operands, there are only a few actually: STOP, RETTR, MOVFLGA, MOVSPA, RETx, NOPx, NOTr, NEGr, ASLr, ASRr, RORr, ROLr.
