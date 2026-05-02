<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>

<!--
    team_summary.xsl
    ROHAN — 30 April 2026

    This stylesheet creates a simple summary of each team in the club.
    It pulls together the team name, its members, and the coach so the
    information is easier to read than in the full database.
-->


    <!-- Match club anywhere -->
    <xsl:template match="club">
        <teamSummary>
            <xsl:apply-templates select="teams/team"/>
        </teamSummary>
    </xsl:template>

    <!-- Each team -->
    <xsl:template match="team">
        <team>
            <id><xsl:value-of select="@id"/></id>
            <name><xsl:value-of select="name"/></name>

            <!-- Coach lookup -->
            <coach>
                <xsl:value-of 
                    select="/club/coaches/coach[@id=current()/coachRef]/name"/>
            </coach>

            <!-- Members via bookings -->
            <members>
                <xsl:for-each 
                    select="/club/bookings/booking[teamRef=current()/@id]">
                    <member>
                        <id><xsl:value-of select="memberRef"/></id>
                        <name>
                            <xsl:value-of 
                                select="/club/members/member[@id=current()/memberRef]/name"/>
                        </name>
                    </member>
                </xsl:for-each>
            </members>

        </team>
    </xsl:template>

</xsl:stylesheet>
