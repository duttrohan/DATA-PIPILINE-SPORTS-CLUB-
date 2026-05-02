<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--
    free_facilities.xsl
    Author: ROHAN — 02 May 2026

    User Story: “I want to know which facilities are free on a given day.”
    This stylesheet checks all sessions on the selected date and identifies
    which facilities are not booked.
-->


    <xsl:param name="date"/>

    <xsl:template match="/">
        <freeFacilities date="{$date}">
            <xsl:for-each select="club/facilities/facility">
                <xsl:variable name="fid" select="@id"/>
                <xsl:if test="not(/club/sessions/session[@facilityId=$fid and date=$date])">
                    <facility id="{$fid}">
                        <name><xsl:value-of select="name"/></name>
                    </facility>
                </xsl:if>
            </xsl:for-each>
        </freeFacilities>
    </xsl:template>

</xsl:stylesheet>
