(: listar año y título de todos los libros, ordenados por año :)
for $x in doc('biblioteca.xml')/biblioteca/libro
order by $x/anyo
return <libro><año>{$x/anyo/data()}</año><titulo>{$x/titulo/data()}</titulo></libro>,

(: listar año y título de todos los libros ordenados por año, estructurados en xml:)
for $x in doc('biblioteca.xml')/biblioteca/libro
order by $x/anyo
return concat($x/anyo/data(), ", ", $x/titulo/data()),

(: listar los libros cuyo título sea XML :)
for $x in doc('biblioteca.xml')/biblioteca/libro
where $x/titulo = "XML"
return $x,

(: listar los libros publicados antes del año 2000 :)
for $x in doc('biblioteca.xml')/biblioteca/libro
where $x/anyo < 2000
return $x,

(: listar año y título de los libros publicados por la editorial Addison Wesley después del 1992 :)
for $x in doc('biblioteca.xml')/biblioteca/libro
where $x/editorial = "Addison Wesley" and $x/anyo > 1992
return concat($x/anyo/data(), ", ", $x/titulo/data()),

(: listar año y título de los libros que tienen más de un autor :)
for $x in doc('biblioteca.xml')/biblioteca/libro
let $a := $x/autor
where count($a) > 1
return concat($x/anyo/data(), ", ", $x/titulo/data()),

(: listar año y título de los libros que no tienen autor :)
for $x in doc('biblioteca.xml')/biblioteca/libro
let $a := $x/autor
where count($a) = 0
return concat($x/anyo/data(), ", ", $x/titulo/data()),

(: listar los apellidos de los autores que aparecen en el documento, sin repeticiones, ordenados alfabéticamente :)
for $x in doc('biblioteca.xml')/biblioteca/libro
order by $x/autor
return $x/autor/data(),

(: por cada libro, listar agrupado en un elemento result, su título y autores :)
for $x in doc('biblioteca.xml')/biblioteca/libro
return <result><titulo>{$x/titulo/data()}</titulo><autor>{$x/autor/data()}</autor></result>,

(: por cada libro, ordenar su título y el número de autores, agrupados en un elemento libro :)
for $x in doc('biblioteca.xml')/biblioteca/libro
let $a := $x/autor
return <libro><titulo>{$x/titulo/data()}</titulo><autores>{count($a)}</autores></libro>
