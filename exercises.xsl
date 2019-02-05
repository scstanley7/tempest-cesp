<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs tei"
    version="2.0" xmlns:tei="http://www.tei-c.org/ns/1.0">
    
    <!-- Create an HTML version of the play that: -->
    <!--  * render headings with whatever flavor of HTML head you so choose -->
    <!--  * renders all stage directions aligned right -->
    <!--  * makes speaker labels bold -->
    <!--  * puts the first lines of speeches on the same line as the label -->
    <!--  * aligns all page numbers right -->
    <!--  * maintains all existing line breaks -->
    <!--  * renders all <hi> elements as italics -->
    <!--  * renders the cast list as an unordered html list -->
    <!--    * make sure that any nested lists are also rendered as nested lists -->
    <!--    * you may need to do some creative things with role/roleDesc. I'm excited to see what you do :) -->
    
    <!-- Some things to remember: -->
    <!--  * Don't forget to use the `tei:` prefix! -->
    <!--  * You don't need to write rules for *everything*, just the stuff you want to render in a specific way -->
    
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="tei:teiHeader"/>
    
    <xsl:template match="tei:text">
        <html>
            <head>
                <title>The Tempest - Test</title>
            </head>
            <xsl:apply-templates/>
        </html>
    </xsl:template>
    
</xsl:stylesheet>