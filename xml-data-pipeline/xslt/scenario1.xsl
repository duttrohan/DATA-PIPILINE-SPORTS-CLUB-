<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

<!--
    scenario1.xsl
    Author: ROHAN — 02 May 2026

    Scenario 1 transformation. This stylesheet extracts a specific slice
    of the club data to demonstrate how targeted XML views can be created.
-->

    <xsl:template match="/">

        <html>
        <head>
            <title>IPL 2025 - Members Report</title>
        </head>

        <body>

            <h2>IPL 2025 Players (Members Report)</h2>

            <table border="1">
                <tr>
                    <th>Player ID</th>
                    <th>Player Name</th>
                    <th>Age</th>
                </tr>

                <xsl:for-each select="club/members/member">
                    <tr>
                        <td><xsl:value-of select="@id"/></td>
                        <td><xsl:value-of select="name"/></td>
                        <td><xsl:value-of select="age"/></td>
                    </tr>
                </xsl:for-each>

            </table>

        </body>
        </html>

    </xsl:template>

</xsl:stylesheet>