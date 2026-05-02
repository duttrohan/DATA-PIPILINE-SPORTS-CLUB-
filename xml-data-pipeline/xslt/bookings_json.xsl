<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" indent="no"/>

    <xsl:template match="/club">
        {
          "bookings": [
            <xsl:for-each select="bookings/booking">
              {
                "id": "<xsl:value-of select="@id"/>",
                "member": "<xsl:value-of select="/club/members/member[@id = current()/memberRef]/name"/>",
                "team": "<xsl:value-of select="/club/teams/team[@id = current()/teamRef]/name"/>",
                "facility": "<xsl:value-of select="/club/facilities/facility[@id = current()/facilityRef]/name"/>"
              }<xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
          ]
        }
    </xsl:template>

</xsl:stylesheet>
