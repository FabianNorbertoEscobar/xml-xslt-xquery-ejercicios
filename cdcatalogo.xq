(: listar los títulos de los cds con precio menor a 10 :)
for $cd in doc('cdcatalogo.xml')/catalogo/cd
where $cd/precio < 10
return $cd/titulo/data(),

(: listar los títulos de los cds con precio mayor a 30 :)
for $cd in doc('cdcatalogo.xml')/catalogo/cd
where $cd/precio > 30
return $cd/titulo/data(),

(: listar los títulos y artistas de los cds :)
for $cd in doc('cdcatalogo.xml')/catalogo/cd
return concat($cd/titulo/data(), ", ", $cd/artista/data()),

(: listar las empresas que produjeron cds de artistas argentinos :)
for $cd in doc('cdcatalogo.xml')/catalogo/cd
where $cd/pais = "ARG"
return $cd/empresa/data(),

(: listar los precios y títulos de los cds cuyos precios sean mayores al promedio, ordenados descendentemente por precio :)
for $cd in doc('cdcatalogo.xml')/catalogo/cd
let $prom := avg(for $x in doc('cdcatalogo.xml')/catalogo/cd return $x/precio/data())
where $cd/precio > $prom
order by $cd/precio descending
return concat($cd/precio/data(), ", ", $cd/titulo/data()),

(: listar las empresas que tengan los más viejos :)
for $cd in doc('cdcatalogo.xml')/catalogo/cd
let $min := min(for $y in doc('cdcatalogo.xml')/catalogo/cd return $y/año/data())
where $cd/año = $min
return $cd/empresa/data()
