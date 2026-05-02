<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<!--
    scenario6_bookings.xsl
    Author: ROHAN — 02 May 2026

    Scenario 6 transformation. This stylesheet focuses on bookings and
    organizes them into a clear, readable structure.
-->


<xsl:template match="/">

<html>
<head>
    <title>Bookings Report</title>
</head>

<body>

<h2>Bookings Report</h2>

<table border="1">
<tr>
    <th>Booking ID</th>
    <th>Member Name</th>
    <th>Facility Name</th>
</tr>

<xsl:for-each select="club/bookings/booking">

<tr>
    <td>
        <xsl:value-of select="@id"/>
    </td>

    <td>
        <xsl:value-of select="/club/members/member[@id=current()/memberRef]/name"/>
    </td>

    <td>
        <xsl:value-of select="/club/facilities/facility[@id=current()/facilityRef]/name"/>
    </td>

</tr>

</xsl:for-each>

</table>

</body>
</html>

</xsl:template>

</xsl:stylesheet>