<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="ies/@nombre"/>
				</title>
				<meta charset="UTF-8"/>
			</head>
			<body>
				<h1>Ciclos anidados</h1>
				<ul>
					<xsl:apply-templates select="//ciclo"/>
				</ul>
			</body>
		</html>
	</xsl:stylesheet>
	<xsl:template match="ciclo">
		<li>
			<xsl:value-of select="@id"/>:<xsl:value-of select="nombre"/>
		</li>
	</xsl:stylesheet>

</xsl:stylesheet>