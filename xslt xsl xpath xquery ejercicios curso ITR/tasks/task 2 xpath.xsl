<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <b>
                    <xsl:value-of select="StudentScores/College" />
                </b>
                <xsl:apply-templates select="StudentScores/Student[@id=4]" />
            </body>
        </html>
    </xsl:template>
    <xsl:template match="Student">
        <br />
        First Name:
        <xsl:value-of select="FirstName" />
        <br />
        Last Name:
        <xsl:value-of select="LastName" />
        <br />
        Score:
        <xsl:value-of select="Score" />
    </xsl:template>
</xsl:stylesheet>