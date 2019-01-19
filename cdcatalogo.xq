<!-- listar los títulos de los cds con precio menor a 10 -->
for $x in doc('cdcatalogo.xml')/catalogo/cd
where $x/precio < 10
return $x/titulo

<!-- listar los títulos de los cds -->
for $x in doc('cdcatalogo.xml')/catalogo/cd/titulo
return
	<titulos>{$x}</titulos>

<!-- listar las empresas que produjeron cds de artistas argentinos -->
for $x in doc('cdcatalogo.xml')/catalogo/cd
where $x/pais = "ARG"
return $x/empresas

