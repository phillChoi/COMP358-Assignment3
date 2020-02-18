#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jun  1 11:42:06 2018

@author: Phillip Choi
"""

from rdflib import Graph
if __name__ == '__main__':
    g = Graph()

    res = g.parse('http://localhost:8085/weather-2.html', format='rdfa')

res1 = g.query("""
SELECT ?minTemp  
WHERE { <http://localhost:8085/weather-2.html> 
weather:minTemp ?minTemp . }
""")
   
for row in res1:
    print("Minimum temp of %s" % row)
print()

res2 = g.query("""
SELECT ?obj  
WHERE { <http://localhost:8085/weather-2.html> 
weather:region ?obj . }
""")
for row in res2:
    print("The weather region is: %s" % row)
print()

res3 = g.query("""
SELECT ?obj  
WHERE { <http://localhost:8085/weather-2.html> 
weather:town ?obj . }
""")
for row in res3:
    print("Area of %s" % row)
print()

res4 = g.query("""
SELECT ?obj  
WHERE { <http://localhost:8085/weather-2.html> 
weather:forecast ?obj . }
""")
for row in res4:
    print("The forecast is: %s" % row)
print()