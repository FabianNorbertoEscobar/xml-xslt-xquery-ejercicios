<!-- listar los títulos de las películas que cuesten de 90 y Bale sea uno de sus actores -->
for $b in doc("videoclub.xml")/Videoclub/Pelicula
	where $b/@Precio < 90
	and $b/Actores/Actor/Apellido = "Bale"
return $b/Titulo

<!-- listar las películas cuyo título tenga el nombre de alguno de sus actores -->
for $b in doc("videoclub.xml")/Videoclub/Pelicula
	where some $nombre in $b/Actores/Actor/Nombre
		satisfies contains($b/Titulo, $Nombre)
return  <Pelicula>
			{	$b/Titulo	}
			{	$b/Actores/Actor/Nombre 	}
		</Pelicula>

<!-- promedio de los precios de las películas -->
<Promedio>
	{ 	let $lista_precios := doc("videoclub.xml")
		/Videoclub/Pelicula/@Precio
		return avg($lista_precios)	}
</Promedio>

<!-- listar las películas que tengan un precio menor al promedio -->
let $a := avg(doc("videoclub.xml")/Videoclub/Pelicula/@Precio)
for $b in doc("videoclub.xml")/Videoclub/Pelicula
	where $b/@Precio < $a
return	<Pelicula>
			{	$b/Titulo	}
			<Precio> {		$b/data(@Precio)	}	</Precio>
		</Pelicula>

<!-- listar los actores con sus películas -->
<VideoclubInvertido>
	{	for $apellido in distinct-values(doc("videoclub.xml")
			//Autor/Apellido)
		for $nombre in distinct-values(doc("videoclub.xml")
			//Autor[Apellido=$apellido]/Nombre)	

		return
			<Autor>
				<Nombre>    {	$Nombre    }	</Nombre>
				<Apellido>    {		$Apellido	}	</Apellido>
				{	for $b in doc("videoclub.xml")
						/VideoClub/Pelicula[
							Actores/Actor/Apellido = @apellido]

					return  <Pelicula>
								{	$b/    } {	$b/@Precio	}
								{	$b/Titulo	}
							</Pelicula>    }
			</Autor>    }
</VideoclubInvertido>