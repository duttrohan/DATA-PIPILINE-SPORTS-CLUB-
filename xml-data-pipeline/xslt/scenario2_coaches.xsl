<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<!--
    scenario2_coaches.xsl
    Author: ROHAN — 02 May 2026

    Scenario 2 transformation. This stylesheet focuses on coaches and
    presents their details in a simplified, readable structure.
-->



<xsl:template match="/">

<html>
<head>
    <title>Coaches Report</title>
</head>

<body>

<h2>Coaches List</h2>

<table border="1">
<tr>
    <th>ID</th>
    <th>Name</th>
</tr>

<xsl:for-each select="club/coaches/coach">

<tr>
    <td><xsl:value-of select="@id"/></td>
    <td><xsl:value-of select="name"/></td>
</tr>

</xsl:for-each>

</table>

</body>
</html>

</xsl:template>

</xsl:stylesheet>