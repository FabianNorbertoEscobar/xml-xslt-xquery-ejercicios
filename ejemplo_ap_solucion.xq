"1-Mostrar el nombre de los equipos cuyo nombre comienza por A o M, ordenados por nombre. Mostrar el resultado sin etiquetas.",
for $e in /equipos/equipo
where starts-with(
  $e/@nombre,"A"
) or starts-with(
  $e/@nombre,"M"
)
order by $e/@nombre
return $e/@nombre/data(),
"2-Mostrar los nombres de los jugadores con sus apellidos cuyo códigos están comprendidos entre 10 y 20, ordenados alfabéticamente por apellidos. El formato de salida debe ser en xml similar al siguiente, teniendo en cuenta que vamos a enumerar el resultado con un atributo.",
"--------------lo que hicimos en clase------",
for $j at $cont in /jugadores/jugador
order by $j/nombre
return <j num="{$cont}">{$j/nombre/data()}</j>,"------------------ esto si----",
for $j in /jugadores/jugador
where $j/@cod >= 10 and $j/@cod <= 20
order by $j/apellido1, $j/apellido2
return $j,
"-----",
<jugadores>{
  for $i at $cont in (
    for $j in /jugadores/jugador
where $j/@cod >= 10 and $j/@cod <= 20
order by $j/fecha_nacimiento
return concat(
      $j/apellido1, " ", $j/apellido2, ", ", $j/nombre
    )
  )
return <jugador num="{
    $cont
  }">{
    $i
  }</jugador>
}</jugadores>,
"3-Mostrar los nombres de los equipos junto con números de telefonos de los entrenadores, devolver el resultado en formato texto",
for $e in //equipos/equipo, $en in //entrenadores/entrenador
where $e/entrenador = $en/@cod
return concat(
  "equipo: ", $e/@nombre, " - tfn: ", $en/telefono
),
"4-Mostrar un listado de cada equipo , junto al nombre de su capital en un xml válido",
<capitanes>{
  for $e in //equipos/equipo, $c in //jugadores/jugador
where $e/capitan = $c/@cod
return <capitan equipo="{
    $e/@nombre
  }">{
    concat(
      $c/nombre/data(), " ",$c/apellido1/data(), " ", $c/apellido2/data()) 
  }</capitan>
}</capitanes>,
"5-Mostrar cada uno de diferentes años de nacimiento de todos los jugadores, junto al número de jugadores que hay de cada año",
for $anyo in distinct-values(
  for $f in //jugadores/jugador/fecha_nacimiento
order by $f
return year-from-date(
    $f
  )
)
return (
  $anyo
),
//jugadores/jugador[year-from-date(
  fecha_nacimiento
)=1999]/nombre,
"--------------",
for $anyo in distinct-values(
  for $f in //jugadores/jugador/fecha_nacimiento
order by $f
return year-from-date(
    $f
  )
)
return (
  $anyo,//jugadores/jugador[year-from-date(
    fecha_nacimiento
  )=$anyo]/nombre
),
"==================",
for $anyo in distinct-values(
  for $f in //jugadores/jugador/fecha_nacimiento
order by $f
return year-from-date(
    $f
  )
)
return (
  $anyo, 
  (
    for $jj in //jugadores/jugador
  where year-from-date(
      $jj/fecha_nacimiento
    )=$anyo
  return concat(
      "- ", $jj/nombre/data(), " ", $jj/apellido1/data(), " ", $jj/apellido2/data())
)
)

