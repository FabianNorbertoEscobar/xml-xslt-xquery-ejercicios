<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
		<body>
			<h2>Mi Colección de CDs</h2>

			<table border="2">
				<tr bgcolor="#FF0000">
					<th>Titulo</th>
					<th>Artista</th>
					<th>País</th>
					<th>Empresa</th>
					<th>Precio</th>
					<th>Año</th>
				</tr>

				<xsl:for-each select="catalogo/cd">
					<tr>
						<td><xsl:value-of select="titulo"/></td>
						<td><xsl:value-of select="artista"/></td>
						<td><xsl:value-of select="pais"/></td>
						<td><xsl:value-of select="empresa"/></td>
						<td><xsl:value-of select="precio"/></td>
						<td><xsl:value-of select="año"/></td>
					</tr>
				</xsl:for-each>
			</table>	
		</body>
	</html>
</xsl:template>

</xsl:stylesheet>