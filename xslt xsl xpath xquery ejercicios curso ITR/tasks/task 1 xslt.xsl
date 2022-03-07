<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
                <b>
                    <xsl:value-of select="StudentScores/College" />
                </b>
                <table border="1">
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Score</th>
                        <th>Grade</th>
                    </tr>
                    <xsl:for-each select="StudentScores/Student">
                        <xsl:sort select="@id" data-type="number" />
                        <tr>
                            <td>
                                <xsl:value-of select="FirstName" />
                            </td>
                            <td>
                                <xsl:value-of select="LastName" />
                            </td>
                            <td>
                                <xsl:value-of select="Score" />
                            </td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="Score>=90">
                                        A
                                    </xsl:when>
                                    <xsl:when test="Score>=80">
                                        B
                                    </xsl:when>
                                    <xsl:when test="Score>=70">
                                        C
                                    </xsl:when>
                                    <xsl:when test="Score>=60">
                                        D
                                    </xsl:when>
                                    <xsl:otherwise>
                                        F
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>