<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:elml="http://www.elml.ch" version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2004/07/xpath-functions" xmlns:xdt="http://www.w3.org/2004/07/xpath-datatypes" xmlns:fox="http://xml.apache.org/fop/extensions" xmlns:style="urn:oasis:names:tc:opendocument:xmlns:style:1.0" xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0">
    <xsl:import href="../../../core/presentation/odf/elml.xsl"/>
    <!-- ***** Parameter definitions  *****-->
    <!--The name of this layout (=folder name of template folder!) -->
    <xsl:param name="layout" select="'plain'"/>
    <!--On which level would you like have the page break? To generate just one output use "oneoutput", else "lesson", "unit" or "lo" (default is unit) -->
    <xsl:param name="pagebreak_level">unit</xsl:param>
    <!-- default_text-align can be set to start, end, left, right, center, or justify (default is left)-->
    <xsl:param name="default_text-align">justify</xsl:param>
    <!-- hyphenation can be set to true or false (deafault is false) -->
    <xsl:param name="hyphenation">true</xsl:param>
    <!-- select the number of text lines that a paragraph must have before a pagebreak can be set within the paragraph (default is 2)-->
    <xsl:param name="default_paragraph_orphans">2</xsl:param>
    <!-- select font sizes for the Headings of the Levels 1-5 (The highest Heading level is Heading 1) in pt units (default is 20pt for H1, 15pt for H2, 13pt for H3 and 12pt for H4 and H5)-->
    <xsl:param name="Heading1">20pt</xsl:param>
    <xsl:param name="Heading2">15pt</xsl:param>
    <xsl:param name="Heading3">13pt</xsl:param>
    <xsl:param name="Heading4">12pt</xsl:param>
    <xsl:param name="Heading5">12pt</xsl:param>
    <!-- select margin_top for the Headings of the Levels 1-5 (The highest Heading level is Heading 1) in cm units (default is 0.843cm for all)-->
    <xsl:param name="Heading1_margin_top">0.5cm</xsl:param>
    <xsl:param name="Heading2_margin_top">0.5cm</xsl:param>
    <xsl:param name="Heading3_margin_top">0.5cm</xsl:param>
    <xsl:param name="Heading4_margin_top">0.4cm</xsl:param>
    <xsl:param name="Heading5_margin_top">0.3cm</xsl:param>
    <!-- select margin_bottom for the Headings of the Levels 1-5 (The highest Heading level is Heading 1) in cm units (default is 0.212cm for all)-->
    <xsl:param name="Heading1_margin_bottom">0.75cm</xsl:param>
    <xsl:param name="Heading2_margin_bottom">0.6cm</xsl:param>
    <xsl:param name="Heading3_margin_bottom">0.5cm</xsl:param>
    <xsl:param name="Heading4_margin_bottom">0.4cm</xsl:param>
    <xsl:param name="Heading5_margin_bottom">0.3cm</xsl:param>
    <!-- set automatic numbering of the lowest Heading level to true or false (default is true) -->
    <!-- this option is only active if you have the option chapter_numeration activated within the config-file of your lessons ) -->
    <xsl:param name="paragraph_titles_numbered">false</xsl:param>
    <!-- do you wish to keep the CSS-Class-Styles as styles in ODF (default is no)-->
    <xsl:param name="enable_project_styles">yes</xsl:param>
    <!-- define the aquivalent ODF-styles for the CSS-Classes used in the eLML-XML-file-->
    <xsl:template name="project_styles">
        <style:style style:name="paragraph_mit_viel_abstand" style:display-name="paragraph_mit_viel_abstand" style:family="paragraph" style:class="text">
            <style:paragraph-properties fo:line-height="100%" fo:margin-top="0.15cm" fo:margin-bottom="0.15cm">
                <xsl:attribute name="fo:orphans">
                    <xsl:value-of select="$default_paragraph_orphans"/>
                </xsl:attribute>
                <xsl:attribute name="fo:text-align">
                    <xsl:value-of>justify</xsl:value-of>
                </xsl:attribute>
            </style:paragraph-properties>
        </style:style>
        <style:style style:name="paragraph_mit_viel_abstand2" style:display-name="paragraph_mit_viel_abstand2" style:family="paragraph" style:class="text">
            <style:paragraph-properties fo:line-height="100%" fo:margin-top="0.15cm" fo:margin-bottom="0.15cm">
                <xsl:attribute name="fo:orphans">
                    <xsl:value-of select="$default_paragraph_orphans"/>
                </xsl:attribute>
                <xsl:attribute name="fo:text-align">
                    <xsl:value-of>justify</xsl:value-of>
                </xsl:attribute>
            </style:paragraph-properties>
        </style:style>
        <style:style style:name="paragraph_mit_viel_abstand3" style:display-name="paragraph_mit_viel_abstand3" style:family="paragraph" style:class="text">
            <style:paragraph-properties fo:line-height="100%" fo:margin-top="0.25cm" fo:margin-bottom="0.75cm">
                <xsl:attribute name="fo:orphans">
                    <xsl:value-of select="$default_paragraph_orphans"/>
                </xsl:attribute>
                <xsl:attribute name="fo:text-align">
                    <xsl:value-of>justify</xsl:value-of>
                </xsl:attribute>
            </style:paragraph-properties>
        </style:style>
        <style:style style:name="paragraph_mit_viel_abstand3_linksbuendig" style:display-name="Linksbündig_3" style:family="paragraph" style:class="text">
            <style:paragraph-properties fo:line-height="100%" fo:margin-top="0.25cm" fo:margin-bottom="0.75cm">
                <xsl:attribute name="fo:orphans">
                    <xsl:value-of select="$default_paragraph_orphans"/>
                </xsl:attribute>
                <xsl:attribute name="fo:text-align">
                    <xsl:value-of>left</xsl:value-of>
                </xsl:attribute>
            </style:paragraph-properties>
        </style:style>
        <style:style style:name="paragraph_mit_wenig_abstand" style:display-name="paragraph_mit_wenig_abstand" style:family="paragraph" style:class="text">
            <style:paragraph-properties fo:line-height="100%" fo:margin-top="0.15cm" fo:margin-bottom="0.15cm">
                <xsl:attribute name="fo:orphans">
                    <xsl:value-of select="$default_paragraph_orphans"/>
                </xsl:attribute>
                <xsl:attribute name="fo:text-align">
                    <xsl:value-of>justify</xsl:value-of>
                </xsl:attribute>
            </style:paragraph-properties>
        </style:style>
    </xsl:template>
</xsl:stylesheet>
