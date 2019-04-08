<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs tei" version="2.0"
    xmlns:tei="http://www.tei-c.org/ns/1.0">

    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="tei:teiHeader"/>

    <xsl:template match="tei:text">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="style.css"/>
                <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet"/>
                <title>The Tempest - Test</title>
            </head>
            <body>
                <div class="container">
                    <xsl:apply-templates/>
                </div>
            </body>
        </html>
    </xsl:template>
    <!--header transformation-->
    <xsl:template match="tei:head">
        <h1>
            <xsl:apply-templates/>
        </h1>
    </xsl:template>
    <xsl:template match="tei:head[@type eq 'act']">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    <xsl:template match="tei:head[@type eq 'castlist']">
        <h2>
            <xsl:apply-templates/>
        </h2>
    </xsl:template>
    <!--div transformation-->
    <xsl:template match="tei:div[@type eq 'act']">
        <div class="act">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:stage[@type eq 'setting']">
        <div class="scene">
            <h3>
                <xsl:apply-templates/>
            </h3>
        </div>
    </xsl:template>
    <!--castList transformation-->
    <xsl:template match="tei:castList">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <xsl:template match="tei:castItem">
        <li>
            <xsl:apply-templates/>
        </li>
    </xsl:template>
    <xsl:template match="tei:castGroup">
        <ul>
            <xsl:apply-templates/>
        </ul>
    </xsl:template>
    <!--stage tranformation-->
    <xsl:template match="tei:stage">
        <xsl:choose>
            <xsl:when test="@rend[contains(., 'align(right)')]">
                <p style="text-align: right;">
                    <i> [<xsl:apply-templates/>] </i>
                </p>
            </xsl:when>
            <xsl:when test="@rend[contains(.,'align(center)')]">
                <p style="text-align: center;">
                    <i> [<xsl:apply-templates/>] </i>
                </p>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <i> [<xsl:apply-templates/>] </i>
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--speeches transformation-->
    <xsl:template match="tei:sp">
        <div class="speech">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    <xsl:template match="tei:speaker">
        <p class="speaker" style="font-variant: small-caps;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:p">
        <p style="text-indent: 50px;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="tei:l">
        <p style="text-indent: 50px;">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    <!--surpressed-->
    <xsl:template match="tei:fw"/>
    <xsl:template match="tei:fig"/>
    <xsl:template match="tei:figDesc"/>
    <xsl:template match="tei:hyperDiv"/>

</xsl:stylesheet>
