<xsl:stylesheet version="2.0"
	 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" indent="yes" omit­xml­declaration="yes" />
	 <xsl:template match="Pelicula[@Precio &lt; 90]">
		  <xsl:copy­of select="." />
	 </xsl:template>
</xsl:stylesheet>