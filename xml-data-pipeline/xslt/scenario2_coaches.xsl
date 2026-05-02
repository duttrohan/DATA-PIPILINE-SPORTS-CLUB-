<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<!-- 29/04/26 rohan-d
Scenario 2: Coaches Report
This XSLT displays all coaches with their IDs and names
from the XML dataset in a structured HTML table.
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