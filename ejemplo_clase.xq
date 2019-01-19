(: nombre de todos los autores del libro junto con su editorial, sin repeticion:)
for $iter in distinct-values(for $lib in //libro/autor
return concat(string($lib/apellido)," ", string($lib/nombre)))
return <autor editorial="aaa">{$iter}</autor>,
"xxxxxxxxxxxxxxxxxxxxxxxxx",
for $iter in distinct-values(for $lib in //libro/autor
return concat(string($lib/apellido)," ", string($lib/nombre)))
return <autor editorial="a">{$iter}</autor>
,
let $ed :=  //libro[autor=]/editorial
return $ed