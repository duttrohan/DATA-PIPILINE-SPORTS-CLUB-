<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">

<html>
<head>
    <title>Sessions Report</title>
</head>

<body>

<h2>Training Sessions Report</h2>

<table border="1">
<tr>
    <th>Session ID</th>
    <th>Sport</th>
    <th>Team</th>
    <th>Coach</th>
</tr>

<xsl:for-each select="club/sessions/session">

<tr>
    <!-- Session ID -->
    <td><xsl:value-of select="@id"/></td>

    <!-- Sport -->
    <td><xsl:value-of select="sport"/></td>

    <!-- Team Name (lookup via teamRef) -->
    <td>
        <xsl:value-of select="/club/teams/team[@id=current()/teamRef]/name"/>
    </td>

    <!-- Coach Name (lookup via coachRef) -->
    <td>
        <xsl:value-of select="/club/coaches/coach[@id=current()/coachRef]/name"/>
    </td>

</tr>

</xsl:for-each>

</table>

</body>
</html>

</xsl:template>

</xsl:stylesheet>