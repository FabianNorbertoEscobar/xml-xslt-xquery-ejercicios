<!-- títulos de las películas -->
doc("videoclub.xml")/videoclub/Pelicula/Titulo

<!-- títulos de las películas y de los documentales -->
doc("videoclub.xml")/videoclub/(Pelicula | Documental)/Titulo

doc("videoclub.xml")/videoclub/*/Titulo

<!-- películas con precio mayor a 90 -->
doc("videoclub.xml")/videoclub/Pelicula[@precio > 90]

<!-- títulos de las películas con precio mayor a 90 -->
doc("videoclub.xml")/videoclub/Pelicula[@precio > 90]/Titulo

<!-- títulos de las películas con precio mayor a 90 y protagonizadas por Del Toro -->
doc("videoclub.xml")/videoclub/Pelicula[@precio > 90 and Actores/Actor/Apellido = "Del Toro"]/Titulo

<!-- títulos de las películas protagonizadas por Bale y que no tengan como actor a Del Toro -->
doc("videoclub.xml")/videoclub/Pelicula[Actores/Actor/Apellido = "Bale" and count(Actores/Actor[Apellido = "Del Toro"]) = 0]/Titulo

