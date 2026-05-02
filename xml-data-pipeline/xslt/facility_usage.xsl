<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/club">
        <facilityUsage>
            <xsl:apply-templates select="facilities/facility"/>
        </facilityUsage>
    </xsl:template>

    <xsl:template match="facility">
        <facility>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>

            <name><xsl:value-of select="name"/></name>

            <usedBy>
                <xsl:for-each select="/club/bookings/booking[facilityRef = current()/@id]">
                    <team>
                        <xsl:attribute name="id">
                            <xsl:value-of select="teamRef"/>
                        </xsl:attribute>
                        <xsl:value-of select="/club/teams/team[@id = current()/teamRef]/name"/>
                    </team>
                </xsl:for-each>
            </usedBy>
        </facility>
    </xsl:template>

</xsl:stylesheet>
