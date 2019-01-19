<!-- listar año y título de todos los libros, ordenados por año-->
for $x in doc('biblioteca.xml')/biblioteca/libros
order by $x/anyo
return $x/anyo, $x/titulo

<!-- listar los libros cuyo título sea XML-->
for $x in doc('biblioteca.xml')/biblioteca/libros
where $x/titulo = "XML"
return $x 

<!-- listar los libros publicados antes del año 2000 -->
for $x in doc('biblioteca.xml')/biblioteca/libros
where $x/anyo < 2000
return $x

<!-- listar año y título de los libros publicados por la editorial Addison Wesley después del 1992 -->
for $x in doc('biblioteca.xml')/biblioteca/libros
where $x/editorial = "Addison Wesley" and $x/anyo > 1992
return $x/anyo, $x/titulo

<!-- listar año y título de los libros que tienen más de un autor -->
for $x in doc('biblioteca.xml')/biblioteca/libros
let $a := $x/autor
where count($a) > 1
return $x/anyo, $x/titulo

<!-- listar año y título de los libros que no tienen autor -->
for $x in doc('biblioteca.xml')/biblioteca/libros
let $a := $x/autor
where count($a) = 0
return $x/anyo, $x/titulo

<!-- listar los apellidos de los autores que aparecen en el documento, sin repeticiones, ordenados alfabéticamente -->
for $x in doc('biblioteca.xml')/biblioteca/libros
order by $x/autor ascending
return $x/autor

<!-- por cada libro, listar agrupado en un elemento result, su título y autores -->
for $x in doc('biblioteca.xml')/biblioteca/libros
return <result>{$x/titulo, $x/autor}</result>

<!-- por cada libro, ordenar su título y el número de autores, agrupados en un elemento libro -->
for $x in doc('biblioteca.xml')/biblioteca/libros
let $a := $x/autor
return <libro>{$x/titulo, <autores>{count($a)}</autores>}</libro>
