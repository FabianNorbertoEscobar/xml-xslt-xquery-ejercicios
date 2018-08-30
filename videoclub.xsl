<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" omit­xml­declaration="yes" />
	<xsl:template match="Pelicula">
		<PeliculaTitulo>
			<xsl:value­of select="Titulo" />
		</PeliculaTitulo>
	</xsl:template>
<xsl:template match="Documental">
		<DocumentalTitulo>
			<xsl:value­of select="Titulo" />
		</DocumentalTitulo>
	</xsl:template>
</xsl:stylesheet>
