<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:elml="http://www.elml.ch" version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes" xmlns:fox="http://xml.apache.org/fop/extensions">
	<xsl:import href="../../../core/presentation/print/elml.xsl"/>
	<!-- ***** Parameter definitions  *****-->
	<!--The name of this layout (=folder name of template folder!) -->
	<xsl:param name="layout" select="'plain'"/>
    <xsl:param name="pagebreak_level" select="'unit'"/>
    <!-- ***** Override template definitions  ***** -->
    <!-- More space between paragraphs -->
	<xsl:template match="elml:paragraph" mode="icon">
		<fo:block space-after="{$lineheight}">
			<xsl:call-template name="elml:Label"/>
			<xsl:apply-templates mode="#default"/>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>
