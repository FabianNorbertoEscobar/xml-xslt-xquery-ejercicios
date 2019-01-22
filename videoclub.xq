(: listar los títulos de las películas que cuesten de 90 y Bale sea uno de sus actores :)
for $b in doc("videoclub.xml")/Videoclub/Pelicula
where $b/@Precio < 90
and $b/Actores/Actor/Apellido = "Bale"
return $b/Titulo/data(),

(: listar las películas cuyo título tenga el nombre de alguno de sus actores :)
for $b in doc("videoclub.xml")/Videoclub/Pelicula
where some $nombre in $b/Actores/Actor/Nombre
satisfies contains($b/Titulo, $nombre)
return $b/Titulo/data(),

(: mostrar el promedio de los precios de las películas, entre tags:)
<Promedio>{let $lista_precios := doc("videoclub.xml")/Videoclub/Pelicula/@Precio
return avg($lista_precios)}</Promedio>,

(: listar las películas y precios de las películas que tengan un precio menor al promedio :)
let $a := avg(doc("videoclub.xml")/Videoclub/Pelicula/@Precio)
for $b in doc("videoclub.xml")/Videoclub/Pelicula
where $b/@Precio < $a
return concat($b/Titulo/data(), ", ", $b/@Precio/data())
