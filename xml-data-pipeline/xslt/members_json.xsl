<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" indent="no"/>

<!--
    members_json.xsl
    ROHAN— 30 April 2026

    This stylesheet converts the member information into a JSON‑style
    structure. It's meant to show how the same XML data can be reshaped
    for systems that expect JSON-like output.
-->


    <xsl:template match="/club">
        {
          "members": [
            <xsl:for-each select="members/member">
              {
                "id": "<xsl:value-of select="@id"/>",
                "name": "<xsl:value-of select="name"/>",
                "age": <xsl:value-of select="age"/>
              }<xsl:if test="position() != last()">,</xsl:if>
            </xsl:for-each>
          ]
        }
    </xsl:template>

</xsl:stylesheet>
