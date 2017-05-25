# Semaine 2

Au programme:

* Les comparaisons
* Les instructions de branchement

## Intro

Un branchement s'effectue depuis le flot de votre code vers des symboles ou des adresses définies directement (fortement déconseillé, à la moindre modification du code source, les adresses deviennent invalides).

On va travailler avec les structures de contrôle de flot que vous connaissez des langages de programmation de plus haut niveau avec des variables de types primitifs pour plus de facilité à la traduction en assembleur.

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
	if c < 'A' or if c > 'z' then
		print "There was a non-letter character in the string"
		# Since there was an error, we exit with error code 1
		# This is useful in real-world programs, but in Pep/8,
		# we will just represent it with a `STOP` instruction.
		exit 1
	end
	if c > 'Z' and c < 'a' then
		print "There was a non-letter character in the string"
		exit 1
	end
	c = chari
end

print "The string contained letters only"

~~~
