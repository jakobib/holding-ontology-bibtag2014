---
title: Stand der Holding Ontology für Bestandsdaten
date: 5.6.2014
author: Carsten Klee, Jakob Voß
place: DINI-KIM-Workshop auf dem Bibliothekstag Bremen
institute: Zeitschriftendatenbank (ZDB) & Verbundzentrale des GBV (VZG)
...

# Hintergrund 

## Motivation

**Ziel:** einheitliche RDF-Repräsentation von Bestandsdaten

* Viele bibliographische RDF-Daten, wenig Bestandsangaben
* DINI-KIM AG Bestandsdaten seit April 2013
    * [Wiki-Seite](http://wiki.dnb.de/x/johZB) im DNB-Wiki
    * [Mailingliste](http://lists.dnb.de/mailman/listinfo/dini-ag-kim-bestandsdaten)
    * [GitHub-Repository](https://github.com/dini-ag-kim/holding-ontology) & Issue-Tracker
    * Diskussion auf Englisch
    * Geringe Beteiligung

## Statt das Rad neu zu erfinden

Standards
  : ISO 20775 Schema for holdings information, ISO 18626 Interlibrary Loan Transactions,
    Z39.71-2006 Holdings Statements for Bibliographic Items, MARC21 Holdings, ZETA

    *\ $\Longrightarrow$ typische Attribute von Bestandsdaten*

Ontologien
  : BIBFRAME (`bf`), Bibliographic Ontology (`bibo`),
    DCMI Metadata Terms (`dct`), FOAF (`foaf`), FRBR (`frbr`),
    GoodRelations (`gr`), RDA (`rda_`), Schema.org (`schema`)...

    *\ $\Longrightarrow$ vorhandener RDF-Ressourcen*

## Verwandte Mikro-Ontologien

(Weiter)entwickelt im Rahmen der Holdings Ontology

DAIA
  : Document Availability Information API\
    *Verfügbarkeit von Diensten an Dokumenten/Exemplaren*

DSO
  : Document Service Ontology\
    *Dienste an Dokumenten/Exemplaren*\
    *(Ausleihe, Präsenzansicht, Fernleihe..)*

ECPO
  : Enumeration and Chronology of Periodicals Ontology\
    *Erscheinungs- und Besitzverläufe von Reihen*\
    *(Anfang/Ende, Jahrgänge, Ausgaben, Lücken...)*

# Ergebnis

---

Holding Ontology (aktuell Version 0.1.3)\
<http://purl.org/ontology/holding>

*Keep it simple and open!*

## Drei Entitäten

Dokument
  : Alles was sich sammeln & beschreiben lässt\
    `bibo:Document`, `foaf:Document`, `bf:Work`, `bf:Instance`, `schema:CreativeWork`
Item
  : Exemplar oder Kopie eines Dokuments\
    `frbr:Item`, `bf:HeldItem`, `rdac:Item`
Agent
  : Bibliothek, Informationseinrichtung, Sammler...\
    `bf:Agent`, `foaf:Agent`, `schema:Organization` , `schema:Person`, `rdac:Agent`

*Item und Document sind nicht disjunkt!*

## Exemplar-, Bestands- und Sammlungsbeziehungen

~~~ {.ditaa .dpi=180 .no-shadows}
       +------------+      collectedBy
       |  Document  |--------------------------+
       |            |<-----------------------+ |
       +------------+      collects          | v
            ^ |                          +---------+
 exemplarOf | | exemplar                 |  Agent  |
            | v                          +---------+
        +--------+         holds             | ^
        |  Item  |<--------------------------+ |
        |        |-----------------------------+
        +--------+         heldBy
~~~

## Exemplarbeziehungen zu Über- und Untergeordneten Teilen

~~~ {.ditaa .dpi=180 .no-shadows} 
     +--------+      exemplar      +------------+
     |  Item  |<-------------------|  Document  |
     |        |------------------->|            |
     +--------+     exemplarOf     +------------+
        | ^                                  |
        | |                                  |
        | |       broaderExemplar            |
        | +-----------------------------+    | dct:hasPart
        +-----------------------------+ |    |
                 broaderExemplarOf    | |    | 
                                      | |    |
                                      v |    v
     +--------+      exemplar      +------------+
     |  Item  |<-------------------|  Document  |
     |        |------------------->|            |
     +--------+     exemplarOf     +------------+
                                      | ^    |
                                      | |    |
                 narrowerExemplar     | |    | 
        +-----------------------------+ |    | dct:hasPart
        | +-----------------------------+    |
        | |     narrowerExemplarOf           | 
        | |                                  |
        v |                                  v
     +--------+      exemplar      +------------+
     |  Item  |<-------------------|  Document  |
     |        |------------------->|            |
     +--------+     exemplarOf     +------------+
~~~

## Weitere Klassen aus verwandten Ontologien

~~~ {.neato .dpi=170}
strict graph {
  node[shape=rect]

  Document[pos="0,1!",style=bold];
  Item[pos="0,0!",style=bold];
  Agent[pos="2,1!",style=bold];

  Service[pos="2,0!"];
  Location[pos="2,-1!"];
  Chronology[pos="0,-1!"];
  Offer[pos="4,0!"];

  Item -- Document; 
  Item -- Chronology;
  Item -- Agent;
  Item -- Service;
  Document -- Agent;
  Service -- Agent;
  Item -- Location;
  Service -- Location;

  Service -- Offer[style=dotted];
  Agent -- Offer[style=dotted];
  Location -- Offer[style=dotted];
}
~~~

Abgedeckt durch: ECPO, Schema.org, Bibframe, DSO... 

## Stand der Entwicklung

* Alle wesentlichen Bestandsinformationen können ausgedrückt und abgefragt werden
* Einige Details sind noch offen
* Keine abschließenden Empfehlungen
    * Bibframe, RDA, Schema.org
    * Evaluation durch echte Daten notwendig
* Weitere Informationen
    * <http://wiki.dnb.de/x/johZB>
    * <http://purl.org/ontology/holding>

