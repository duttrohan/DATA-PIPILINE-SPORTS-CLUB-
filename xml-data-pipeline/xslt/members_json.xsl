<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" indent="no"/>

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
