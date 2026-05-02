<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

<!--
    team_performance.xsl
    ROHAN — 30 April 2026

    This stylesheet creates a performance‑oriented view of each team.
    It reorganizes the team and session information into a format that
    could be used for reporting or analytics.
-->


    <xsl:template match="/club">
        <teamPerformance>
            <xsl:for-each select="teams/team">
                <xsl:sort select="points" data-type="number" order="descending"/>

                <team id="{@id}">
                    <name><xsl:value-of select="name"/></name>

                    <coach>
                        <xsl:value-of select="/club/coaches/coach[@id = current()/coachRef]/name"/>
                    </coach>

                    <wins><xsl:value-of select="wins"/></wins>
                    <losses><xsl:value-of select="losses"/></losses>
                    <points><xsl:value-of select="points"/></points>

                    <ratio>
                        <xsl:value-of select="format-number(wins div (wins + losses), '0.00')"/>
                    </ratio>

                    <xsl:if test="position() = 1">
                        <rank>Top Team</rank>
                    </xsl:if>
                </team>
            </xsl:for-each>
        </teamPerformance>
    </xsl:template>

</xsl:stylesheet>
