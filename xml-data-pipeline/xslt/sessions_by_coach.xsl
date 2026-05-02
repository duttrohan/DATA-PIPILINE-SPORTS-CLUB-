<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<!--
    sessions_by_coach.xsl
    Author: ROHAN — 02 May 2026

    User Story: “I want to see all sessions coached by a specific coach.”
    This stylesheet filters the sessions based on the selected coach ID
    and produces a clean list of only those sessions.
-->

	

    <xsl:param name="coachId"/>

    <xsl:template match="/">
        <sessionsByCoach coach="{$coachId}">
            <xsl:for-each select="club/sessions/session[@coachId=$coachId]">
                <session id="{@id}">
                    <date><xsl:value-of select="date"/></date>
                    <team>
                        <xsl:value-of select="/club/teams/team[@id=current()/@teamId]/name"/>
                    </team>
                    <facility>
                        <xsl:value-of select="/club/facilities/facility[@id=current()/@facilityId]/name"/>
                    </facility>
                </session>
            </xsl:for-each>
        </sessionsByCoach>
    </xsl:template>

</xsl:stylesheet>
