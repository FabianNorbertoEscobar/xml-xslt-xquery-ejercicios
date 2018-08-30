<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" indent="yes" />
	<xsl:template match="/">
		<html>
			<table border="1">
				<th>Pelicula</th>
				<th>Precio</th>
				<xsl:for­each select="Videoclub/Pelicula">
				   <xsl:sort select="@Precio" />
				   <xsl:if test="@Precio &lt; 90">
					  <tr>
						 <td>
							<i>
								<xsl:value­of select="Titulo" />
							</i>
						 </td>
						 <td>
							<xsl:value­of select="@Precio" />
						 </td>
					  </tr>
				   </xsl:if>
				</xsl:for­each>
			</table>
		</html>
	</xsl:template>
</xsl:stylesheet>