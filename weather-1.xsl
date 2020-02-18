<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
    <head>
      <link rel="stylesheet" type="text/css" href="weather.css"/>
    </head>
    <body>
	<div>
      <h1>NSW and ACT Weather</h1>
      <xsl:variable name="date" select="product/forecast/area/forecast-period[@index='0']/@start-time-local"/>
      <p>Forecast for the rest of <xsl:value-of select="format-dateTime($date,'[FNn] [D1] [MNn]')"/></p>
      <p><xsl:value-of select="product/forecast/area/forecast-period[@index='0']/text[2]"/> </p>
	</div>
	<div>
    <h1><xsl:value-of select="document('IDN10035.xml')/product/forecast/area[2]/@description"/> Weather</h1>
	<xsl:for-each select="document('IDN10035.xml')/product/forecast/area[2]/forecast-period[position()>1]">
	   <xsl:if test="@index &lt; 4">
	   <xsl:variable name="date" select="@start-time-local"/>
		<p>Forecast for <xsl:value-of select="format-dateTime($date, '[FNn] [D1] [MNn]')"/></p>
		<p><xsl:value-of select="text[@type='forecast']"/></p>
		<p>Min: <xsl:value-of select="../../area[3]/forecast-period[@start-time-local=$date]/element[@type='air_temperature_minimum']"/> Max: <xsl:value-of select="../../area[3]/forecast-period[@start-time-local=$date]/element[@type='air_temperature_maximum']"/></p>
	   </xsl:if>
	</xsl:for-each>
	</div>
	<div>
	<h1><xsl:value-of select="document('IDN11050.xml')/product/forecast/area[3]/@description"/> Weather</h1>
	<xsl:for-each select="document('IDN11050.xml')/product/forecast/area[3]/forecast-period[position()>1]">
	   <xsl:if test="@index &lt; 4">
	   <xsl:variable name="date" select="@start-time-local"/>
		<p>Forecast for <xsl:value-of select="format-dateTime($date, '[FNn] [D1] [MNn]')"/></p>
		<p><xsl:value-of select="text[@type='forecast']"/></p>
		<p>Min: <xsl:value-of select="document('IDN11060.xml')/product/forecast/area[3]/forecast-period[@start-time-local=$date]/element[@type='air_temperature_minimum']"/>  Max: <xsl:value-of select="document('IDN11060.xml')/product/forecast/area[3]/forecast-period[@start-time-local=$date]/element[@type='air_temperature_maximum']"/></p>
	   </xsl:if>
	</xsl:for-each> 
	</div>
	<div>
	<h1>Snow Mountain District</h1>
	<xsl:for-each select="document('IDN11032.xml')/product/forecast/area[2]/forecast-period[position()>1]">
	   <xsl:if test="@index &lt; 4">
	   <xsl:variable name="date" select="@start-time-local"/>
		<p>Forecast for <xsl:value-of select="format-dateTime($date, '[FNn] [D1] [MNn]')"/></p>
		<p><xsl:value-of select="text[@type='forecast']"/></p>
		<p>Snow at <xsl:value-of select="element[@type='snow_elevation_3']"/> m: <xsl:value-of select="element[@type='probability_of_snow_at_elevation_3']"/>.</p>
		<table border="1">
		  <tr>
		   <th>Location</th>
		   <th>Condition</th>
		   <th>Min</th>
		   <th>Max</th>
		  </tr>
		<xsl:for-each select="../../area[position()>2]">
		  <xsl:sort select="@description"/>
		  <tr>
			<td><xsl:value-of select="@description"/></td>
			<td><xsl:value-of select="forecast-period[@start-time-local=$date]/text"/></td>
			<td><xsl:value-of select="forecast-period[@start-time-local=$date]/element[@type='air_temperature_minimum']"/></td>
			<td><xsl:value-of select="forecast-period[@start-time-local=$date]/element[@type='air_temperature_maximum']"/></td>
		  </tr>
		</xsl:for-each>
		</table>
	   </xsl:if>
	</xsl:for-each> 
	</div>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
