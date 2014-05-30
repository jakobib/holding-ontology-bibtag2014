---
title: Stand der Holding Ontology für Bestandsdaten
date: 5.6.2014
author: Carsten Klee, Jakob Voß
location: Bibliothekstag Bremen, DINI-KIM
institution: ZDB & VZG
...

# Hintergrund 

## Motivation

* Viele bibliographische Daten, wenige Bestandsdaten
* AG seit April 2013\
  <http://wiki.dnb.de/x/johZB>
* Diskussion auf Englisch
* Geringe Beteiligung

## Verwandt Standards

* ISO 20775
* ISO 18626 Interlibrary Loan Transactions,
* Holdings Statements for Bibliographic Items
* Z39.71-2006
* MARC21 Holdings
* ZETA
* ...

## Verwandte Ontologien

* Bibliographic Ontology
* BIBFRAME
* RDA
* FRBR
* FOAF
* Dublin Core
* GoodRelations
* Schema.org

Im Rahmen von Holdings Ontology (weiter)entwickelt
* DAIA
* ECPO
* DSO
* Service Ontology

# Ergebnis

---

*Keep it simple and open*

## Drei Entitäten

Dokument
  : Alles was als Dokument gesammelt und beschrieben werden kann
    (`bibo:Document`, `foaf:Document`, `bf:Work`, `bf:Instance`, `schema:CreativeWork`)
Item
  : Exemplar oder Kopie eines Dokuments
    (`frbr:Item`, `bf:HeldItem`, `rdac:Item`)
Agent
  : Bibliothek, Informationseinrichtung, Privatsammler...
    (`bf:Agent`, `foaf:Agent`, `schema:Organization` , `schema:Person`, `rdac:Agent`)

*Item und Document sind nicht disjunkt!*

## Relations & Properties

...

## Weitere Holding-Informationen

* Erscheinungs- und Besitzverläufe

    * bsp. Bibliothek (Agent) hat eine Zeitschrift (Document) im Bestand (holds
      Item), allerdings nur einen bestimmten Verlauf

* Dienstleistungen

    * bspw. Ausleihbar

* Orte und Signatur

    * Wo befindet sich das Exemplar?
    * Welche Signatur hat es?

## Nutzen

* Theoretisch können alle wesentlichen Informationen in Holding Ontology
  ausgedrückt und abgefragt werden (siehe Vortrag zu HO auf der SWIB13)
  <http://de.slideshare.net/nichtich/swib13-holdings-kleevoss>

* Praktisch nützt das wenig solange keine Daten vorhanden sind.

## Stand der Entwicklung

* Weiter Offene Details
* Keine Abschließenden Empfehlungen
* Erstmal eigene Daten publizieren, dann evaluieren

* <https://github.com/dini-ag-kim/holding-ontology>
* <http://purl.org/ontology/holding>
* Mailingliste

