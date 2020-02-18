<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html prefix="weather: http://localhost:8085/weather-vocabulary.html">
    <head>
      <link rel="stylesheet" type="text/css" href="weather.css"/>
    </head>
    <body>
	<div>
      <h1><span property="weather:region">NSW and ACT</span> Weather</h1>
      <xsl:variable name="date" select="product/forecast/area/forecast-period[@index='0']/@start-time-local"/>
      <p>Forecast for the rest of <span property="weather:date"><xsl:value-of select="format-dateTime($date,'[FNn] [D1] [MNn]')"/></span></p>
      <p><span property="weather:forecast"><xsl:value-of select="product/forecast/area/forecast-period[@index='0']/text[2]"/></span> </p>
	</div>
	<div>
    <h1><span property="weather:region"><xsl:value-of select="document('IDN10035.xml')/product/forecast/area[2]/@description"/></span> Weather</h1>
	<xsl:for-each select="document('IDN10035.xml')/product/forecast/area[2]/forecast-period[position()>1]">
	   <xsl:if test="@index &lt; 4">
	   <xsl:variable name="date" select="@start-time-local"/>
		<p>Forecast for <span property="weather:date"><xsl:value-of select="format-dateTime($date, '[FNn] [D1] [MNn]')"/></span></p>
		<p><span property="weather:forecast"><xsl:value-of select="text[@type='forecast']"/></span></p>
		<p>Min: <span property="weather:minTemp"><xsl:value-of select="../../area[3]/forecast-period[@start-time-local=$date]/element[@type='air_temperature_minimum']"/></span> Max: <span property="weather:maxTemp"><xsl:value-of select="../../area[3]/forecast-period[@start-time-local=$date]/element[@type='air_temperature_maximum']"/></span></p>
	   </xsl:if>
	</xsl:for-each>
	</div>
	<div>
	<h1><span property="weather:region"><xsl:value-of select="document('IDN11050.xml')/product/forecast/area[3]/@description"/></span> Weather</h1>
	<xsl:for-each select="document('IDN11050.xml')/product/forecast/area[3]/forecast-period[position()>1]">
	   <xsl:if test="@index &lt; 4">
	   <xsl:variable name="date" select="@start-time-local"/>
		<p>Forecast for <span property="weather:date"><xsl:value-of select="format-dateTime($date, '[FNn] [D1] [MNn]')"/></span></p>
		<p><span property="weather:forecast"><xsl:value-of select="text[@type='forecast']"/></span></p>
		<p>Min: <span property="weather:minTemp"><xsl:value-of select="document('IDN11060.xml')/product/forecast/area[3]/forecast-period[@start-time-local=$date]/element[@type='air_temperature_minimum']"/></span>  Max: <span property="weather:maxTemp"><xsl:value-of select="document('IDN11060.xml')/product/forecast/area[3]/forecast-period[@start-time-local=$date]/element[@type='air_temperature_maximum']"/></span></p>
	   </xsl:if>
	</xsl:for-each>
	</div>
	<div>
	<h1><span property="weather:region">Snow Mountain District</span></h1>
	<xsl:for-each select="document('IDN11032.xml')/product/forecast/area[2]/forecast-period[position()>1]">
	   <xsl:if test="@index &lt; 4">
	   <xsl:variable name="date" select="@start-time-local"/>
		<p>Forecast for <span property="weather:date"><xsl:value-of select="format-dateTime($date, '[FNn] [D1] [MNn]')"/></span></p>
		<p><span property="weather:forecast"><xsl:value-of select="text[@type='forecast']"/></span></p>
		<p>Snow at <xsl:value-of select="element[@type='snow_elevation_3']"/> m: <span property="weather:snowProbability"><xsl:value-of select="element[@type='probability_of_snow_at_elevation_3']"/></span>.</p>
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
			<td><span property="weather:town"><xsl:value-of select="@description"/></span></td>
			<td><span property="weather:condition"><xsl:value-of select="forecast-period[@start-time-local=$date]/text"/></span></td>
			<td><span property="weather:minTemp"><xsl:value-of select="forecast-period[@start-time-local=$date]/element[@type='air_temperature_minimum']"/></span></td>
			<td><span property="weather:maxTemp"><xsl:value-of select="forecast-period[@start-time-local=$date]/element[@type='air_temperature_maximum']"/></span></td>
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
