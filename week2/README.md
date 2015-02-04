# French

# Semaine 2

Au programme:

* Les comparaisons
* Les instructions de branchement

## Intro

Un branchement s'effectue depuis le flow de votre code vers des symboles ou des adresses définies directement (fortement déconseillé, à la moindre modification du code source, les adresses deviennent invalides).

On va travailler avec les structures de contrôle de flow que vous connaissez des langages de programmation de plus haut niveau avec des variables de types primitifs pour plus de facilité à la traduction en assembleur.

Chaque exercice prendra un morceau de pseudo-code qui sera ensuite traduit en PEP-8.

## Exercice 1

Traduisez ce pseudo-code en assembleur

~~~nit

var x = deci

if x > 10 then
	print "> 10"
else
	print "<= 10"
end

~~~

## Exercice 2

Traduisez ce pseudo-code en assembleur

~~~nit

var x = deci

if x < 10 then
	print "< 10"
else
	print ">= 10"
end

~~~

## Exercice 3

Traduisez ce pseudo-code en assembleur

~~~nit

var min = deci
var max = deci
var nb = deci

if nb >= min and nb <= max then
	print "In bounds"
else if nb < min then
	print "Too low"
else
	print "Too high"
end

~~~

## Exercice 4

Traduisez ce pseudo-code en assembleur

~~~nit

var chr = chari

if (chr >= 'a' and chr <= 'z') or (chr >= 'A' and chr <= 'Z') then
	print "It is a letter"
else
	print "Not a letter"
end

~~~

## Exercice 5

Traduisez ce pseudo-code en assembleur

~~~nit

var chr1 = chari
var chr2 = chari

if chr1 > chr2 then
	print "chr1 > chr2"
else if chr1 < chr2 then
	print "chr1 < chr2"
else
	print "chr1 == chr2"
end

~~~

## Exercice 6

Traduisez ce pseudo-code en assembleur

~~~nit

var loops = deci

var i = 0

while i < loops do
	print "Iteration " + i
	i += 1
end

~~~

## Exercice 7

Traduisez ce pseudo-code en assembleur

~~~nit

var loops = deci

for i in [0 .. loops] do
	print "Iteration " + i
end

~~~

## Exercice 8

Traduisez ce pseudo-code en assembleur

~~~nit

var c = chari

while c != '\n' do
	if str[pos] < 'A' or if str[pos] > 'z' then print "There was a non-letter character in the string"
	if str[pos] > 'Z' and str[i] < 'a' then print "There was a non-letter character in the string"
	c = chari
end

print "The string contained letters only"

~~~

# English

# Week 2

Things we'll do:

* Comparisons
* Branching instructions

## Intro

A branching is done within the flow of your code towards symbols or direct addresses (stongly unadvised, since any modification to the code will shift addresses, therefore invalidating statically defined addresses).

Standard flow control structures will be used as basis for the exercises, expressed in higher-level languages for easier understanding. Primitive data types only will be used for an easier translation to assembly language.

Each exercise will be taking a pseudo-code sample as subject for translation to assembly language.

## Exercise 1

Translate this pseudo-code to assembly

~~~nit

var x = deci

if x > 10 then
	print "> 10"
else
	print "<= 10"
end

~~~

## Exercise 2

Translate this pseudo-code to assembly

~~~nit

var x = deci

if x < 10 then
	print "< 10"
else
	print ">= 10"
end

~~~

## Exercise 3

Translate this pseudo-code to assembly

~~~nit

var min = deci
var max = deci
var nb = deci

if nb >= min and nb <= max then
	print "In bounds"
else if nb < min then
	print "Too low"
else
	print "Too high"
end

~~~

## Exercise 4

Translate this pseudo-code to assembly

~~~nit

var chr = chari

if (chr >= 'a' and chr <= 'z') or (chr >= 'A' and chr <= 'Z') then
	print "It is a letter"
else
	print "Not a letter"
end

~~~

## Exercise 5

Translate this pseudo-code to assembly

~~~nit

var chr1 = chari
var chr2 = chari

if chr1 > chr2 then
	print "chr1 > chr2"
else if chr1 < chr2 then
	print "chr1 < chr2"
else
	print "chr1 == chr2"
end

~~~

## Exercise 6

Translate this pseudo-code to assembly

~~~nit

var loops = deci

var i = 0

while i < loops do
	print "Iteration " + i
	i += 1
end

~~~

## Exercise 7

Translate this pseudo-code to assembly

~~~nit

var loops = deci

for i in [0 .. loops] do
	print "Iteration " + i
end

~~~

## Exercise 8

Translate this pseudo-code to assembly

~~~nit

var c = chari

while c != '\n' do
	if str[pos] < 'A' or if str[pos] > 'z' then print "There was a non-letter character in the string"
	if str[pos] > 'Z' and str[i] < 'a' then print "There was a non-letter character in the string"
	c = chari
end

print "The string contained letters only"

~~~
