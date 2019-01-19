"1- Mostrar los nombres y apellidos de todos los entrenadores, ordenados alfabéticamente por apellidos",
for $e in doc("entrenadores1.xml")//entrenador
order by $e/apellido1, $e/apellido2 
return <entrenador>{concat(data($e/apellido1)," ")} {data($e/apellido2)}, {data($e/nombre)} </entrenador>
,"2-Mostrar todos jugadores nacidos en el año 1999, ordenados por fecha de nacimiento",
let $archivos := (doc("jugadores1.xml")//jugador, doc("jugadores2.xml")//jugador)
for $j at $contador in $archivos
where year-from-date($j/fecha_nacimiento)=1999
order by $j/fecha_nacimiento
return $j,
"3-listar los jugadores del equipo Antrax (incluido el capitán) ordenados por código",
for $e in doc("equipos.xml")/equipos/equipo, $j in (doc("jugadores1.xml")|doc("jugadores2.xml"))//jugador
where  ($e/jugadores/jugador | $e/capitan) = $j/@cod
and $e/@nombre="Antrax"
order by $j/@cod
return <jugador equipo="{$e/@nombre}">{$j/@cod}{concat($j/apellido1/text()," ", $j/apellido2/text(),", ",$j/nombre/text())}</jugador>,
"---si usamos let....--------",
for $e in doc("equipos.xml")/equipos/equipo
let $j := (doc("jugadores1.xml")|doc("jugadores2.xml"))//jugador
where  $e/jugadores/jugador = $j/@cod
and $e/@nombre="Antrax"
return <equipo nombre="{$e/@nombre}">{$j/apellido1/text()}{$j/apellido2}</equipo>,
"4-mostrar todos los equipos junto el número de jugadores que tiene, más el capitán",
for $e in doc("equipos.xml")/equipos/equipo
let $jug := count($e/jugadores/jugador)
let $cap := count($e/capitan)
return concat("Equipo: ", $e/@nombre, " // total: ",$jug+$cap, " jugadores")
,"5-mostrar el equipo con más jugadores",
for $e at $cont in doc("equipos.xml")//equipo
let $jug := ($e/jugadores/jugador)
order by count($jug) descending
return <equipo>{$e/@nombre}{count($jug)}</equipo>,
"----------------",
for $ee in doc("equipos.xml")//equipo
let $jugj := ($ee/jugadores/jugador)
let $max := max(
for $e at $cont in doc("equipos.xml")//equipo
let $jug := count($e/jugadores/jugador)
order by $jug descending
return ($jug))
where $max = count($jugj)
return <equipo>{$ee/@nombre}{count($jugj)}</equipo>,
"5-mostrar el equipo del jugador más joven",
for $e in //equipos/equipo
where $e//jugador/data() = (for $j in //jugadores/jugador
order by $j/fecha_nacimiento
return ($j/@cod/data()))[1]
return $e/@nombre/data(),
"6-enumera los distintos equipos junto al nombre, mostrando los equipos de la Z a la A",
for $e at $cont in //equipos/equipo
order by $e/@nombre descending
return <equipo num="{$cont}">{$e/@nombre/data()}</equipo>,
"ordenamos de z a la a",
let $e_ord := for $e in //equipos/equipo
order by $e/@nombre descending
return $e/@nombre/data()
for $equ at $cont in $e_ord
return <equipo num="{$cont}">{$equ}</equipo>,
"7-mostrar los jugadores que no tienen alias y que han nacido en el mes de Febrero",
for $j in //jugadores/jugador
where month-from-date($j/fecha_nacimiento)=2 and not(exists($j/alias))
return ($j)