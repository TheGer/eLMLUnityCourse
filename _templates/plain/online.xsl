<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:elml="http://www.elml.ch" version="2.0" xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="../../../core/presentation/online/elml.xsl"/>
    <!-- ***** Parameter definitions  *****-->
    <!--The name of this layout (=folder name of template folder!) -->
    <xsl:param name="layout" select="'plain'"/>
    <!--If you would like to have a navigation, set this to "yes" else (eg. for content package CP format) to "no" -->
    <xsl:param name="use_navigation" select="'yes'"/>
    <!-- ***** Template definitions  ***** -->
    <xsl:template name="elml:LayoutBody">
        <xsl:param name="prev">
            <xsl:call-template name="elml:prev_file"/>
        </xsl:param>
        <xsl:param name="next">
            <xsl:call-template name="elml:next_file"/>
        </xsl:param>
        <body>
            <xsl:if test="$manifest_type='scorm'">
                <xsl:attribute name="onunload">
                    <xsl:value-of>finish()</xsl:value-of>
                </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="elml:LayoutBodySkiplinks"/>
            <div class="navigation_arrows">
                <xsl:choose>
                    <xsl:when test="$prev='none.html'">
                        <img src="../../../_templates/{$layout}/navigation/back_off.gif" height="12" width="12" alt="No previous page available" border="0"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="{$prev}">
                            <img src="../../../_templates/{$layout}/navigation/back.gif" height="12" width="12" alt="Go to previous page" border="0"/>
                        </a>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="$next='none.html'">
                        <img src="../../../_templates/{$layout}/navigation/next_off.gif" height="12" width="12" alt="No following page available" border="0"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="{$next}">
                            <img src="../../../_templates/{$layout}/navigation/next.gif" height="12" width="12" alt="Go to next page" border="0"/>
                        </a>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
            <xsl:call-template name="elml:navigation"/>
            <a name="top"/>
            <xsl:call-template name="elml:LayoutBodyContent"/>
            <hr/>
            <xsl:call-template name="elml:footer"/>
        </body>
    </xsl:template>
</xsl:stylesheet>
