<?xml version="1.0" encoding="UTF-8"?>

<!--
Scenario 7: IPL 2025 Dashboard Report
Displays team performance and booking details
-->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">

<html>
<head>
    <title>IPL 2025 Dashboard</title>
</head>

<body>

<h1>IPL 2025 Dashboard Report</h1>

<!-- ================= TEAM REPORT ================= -->
<h2>Team Performance</h2>

<table border="1">
<tr>
    <th>Team</th>
    <th>Coach</th>
    <th>Wins</th>
    <th>Losses</th>
    <th>Points</th>
</tr>

<xsl:for-each select="club/teams/team">

<tr>
    <td><xsl:value-of select="name"/></td>

    <td>
        <xsl:value-of select="/club/coaches/coach[@id=current()/coachRef]/name"/>
    </td>

    <td><xsl:value-of select="wins"/></td>
    <td><xsl:value-of select="losses"/></td>
    <td><xsl:value-of select="points"/></td>
</tr>

</xsl:for-each>

</table>

<br/>

<!-- ================= BOOKING REPORT ================= -->
<h2>Booking Details</h2>

<table border="1">
<tr>
    <th>Booking ID</th>
    <th>Player</th>
    <th>Facility</th>
</tr>

<xsl:for-each select="club/bookings/booking">

<tr>
    <td><xsl:value-of select="@id"/></td>

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