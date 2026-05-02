<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<!--
    scenario3_teams.xsl
    Author: Dutt — 02 May 2026

    Scenario 3 transformation. This stylesheet extracts team information
    and organizes it into a clean, structured output.
-->

<xsl:template match="/">

<html>
<head>
    <title>Teams Report</title>
</head>

<body>

<h2>Teams List (with Coach Mapping)</h2>

<table border="1">
<tr>
    <th>Team ID</th>
    <th>Team Name</th>
    <th>Coach Name</th>
</tr>

<xsl:for-each select="club/teams/team">

<tr>
    <td><xsl:value-of select="@id"/></td>
    <td><xsl:value-of select="name"/></td>

    <!-- Coach lookup using coachRef -->
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