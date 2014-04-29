<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
                exclude-result-prefixes="doc"
                version='1.0'>

<xsl:import href="/usr/share/sgml/docbook/stylesheet/xsl/nwalsh/fo/docbook.xsl"/>

<l:l10n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" language="en">
   <l:context name="section-xref">
      <l:template name="sect1" text="section %n (&#8220;%t&#8221;)"/>
      <l:template name="sect2" text="section %n (&#8220;%t&#8221;)"/>
      <l:template name="sect3" text="section %n (&#8220;%t&#8221;)"/>
      <l:template name="sect4" text="section %n (&#8220;%t&#8221;)"/>
      <l:template name="sect5" text="section %n (&#8220;%t&#8221;)"/>
   </l:context>
</l:l10n>

</xsl:stylesheet>
