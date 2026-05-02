<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<!--
    scenario4_sessions.xsl
    Author: ROHAN — 02 May 2026

    Scenario 4 transformation. This stylesheet lists all sessions with
    their key attributes, making the schedule easier to analyze.
-->


<xsl:template match="/">

<html>
<head>
    <title>Facilities Report</title>
</head>

<body>

<h2>Facilities List</h2>

<table border="1">
<tr>
    <th>Facility ID</th>
    <th>Name</th>
    <th>Type</th>
</tr>

<xsl:for-each select="club/facilities/facility">

<tr>
    <!-- Facility ID -->
    <td><xsl:value-of select="@id"/></td>

    <!-- Facility Name -->
    <td><xsl:value-of select="name"/></td>

    <!-- Facility Type (safe fallback if missing) -->
    <td>
        <xsl:value-of select="type"/>
    </td>

</tr>

</xsl:for-each>

</table>

</body>
</html>

</xsl:template>

</xsl:stylesheet>