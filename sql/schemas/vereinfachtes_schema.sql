CREATE SCHEMA IF NOT EXISTS "Vereinfachtes Datenaustauschschema";
SET search_path TO "Vereinfachtes Datenaustauschschema";
CREATE EXTENSION IF NOT EXISTS postgis;
CREATE TABLE IF NOT EXISTS "Vereinfachtes Datenaustauschschema".Flurstueck (
    oid VARCHAR(18) PRIMARY KEY,
    aktualit DATE,
    geometrie GEOMETRY(MultiPolygon, :DEFAULT_CRS),
    idflurst VARCHAR(16),
    flaeche DECIMAL(12, 2),
    flstkennz VARCHAR(20),
    land VARCHAR(254),
    landschl VARCHAR(2),
    gemarkung VARCHAR(254),
    gemaschl VARCHAR(6),
    flur VARCHAR(254),
    flurschl VARCHAR(9),
    flstnrzae VARCHAR(5),
    flstnrnen VARCHAR(4),
    regbezirk VARCHAR(254),
    regbezschl VARCHAR(3),
    kreis VARCHAR(254),
    kreisschl VARCHAR(5),
    gemeinde VARCHAR(254),
    gmdschl VARCHAR(8),
    abwrecht VARCHAR(31),
    lagebeztxt VARCHAR(254),
    tntxt VARCHAR(254)
);
CREATE TABLE IF NOT EXISTS "Vereinfachtes Datenaustauschschema".FlurstueckEigentuemer (
    oid VARCHAR(18) PRIMARY KEY,
    aktualit DATE,
    geometrie GEOMETRY(MultiPolygon, :DEFAULT_CRS),
    idflurst VARCHAR(16),
    flaeche DECIMAL(12, 2),
    flstkennz VARCHAR(20),
    land VARCHAR(254),
    landschl VARCHAR(2),
    gemarkung VARCHAR(254),
    gemaschl VARCHAR(6),
    flur VARCHAR(254),
    flurschl VARCHAR(9),
    flstnrzae VARCHAR(5),
    flstnrnen VARCHAR(4),
    regbezirk VARCHAR(254),
    regbezschl VARCHAR(3),
    kreis VARCHAR(254),
    kreisschl VARCHAR(5),
    gemeinde VARCHAR(254),
    gmdschl VARCHAR(8),
    abwrecht VARCHAR(31),
    lagebeztxt VARCHAR(254),
    tntxt VARCHAR(254),
    eigentuemertxt TEXT
);
CREATE TABLE IF NOT EXISTS "Vereinfachtes Datenaustauschschema".FlurstueckPunkt (
    oid VARCHAR(18) PRIMARY KEY,
    aktualit DATE,
    geometrie GEOMETRY(Point, :DEFAULT_CRS),
    idflurst VARCHAR(16),
    flstkennz VARCHAR(20),
    land VARCHAR(254),
    landschl VARCHAR(2),
    gemarkung VARCHAR(254),
    gemaschl VARCHAR(6),
    flur VARCHAR(254),
    flurschl VARCHAR(9),
    flstnrzae VARCHAR(5),
    flstnrnen VARCHAR(4),
    regbezirk VARCHAR(254),
    regbezschl VARCHAR(3),
    kreis VARCHAR(254),
    kreisschl VARCHAR(5),
    gemeinde VARCHAR(254),
    gmdschl VARCHAR(8)
);
CREATE TABLE IF NOT EXISTS "Vereinfachtes Datenaustauschschema".GebaeudeBauwerk (
    oid VARCHAR(18) PRIMARY KEY,
    aktualit DATE NOT NULL,
    geometrie GEOMETRY(MULTIPOLYGON, :DEFAULT_CRS),
    gebnutzbez VARCHAR(254) NOT NULL,
    funktion VARCHAR(254) NOT NULL,
    gfkzshh VARCHAR(10),
    rellage VARCHAR(254),
    name VARCHAR(254),
    anzahlgs INT
);
CREATE TABLE IF NOT EXISTS "Vereinfachtes Datenaustauschschema".KatasterBezirk (
    oid VARCHAR(11) PRIMARY KEY,
    aktualit DATE NOT NULL,
    geometrie GEOMETRY(MULTIPOLYGON, :DEFAULT_CRS),
    art VARCHAR(254) NOT NULL,
    name VARCHAR(254) NOT NULL,
    schluessel VARCHAR(9) NOT NULL,
    gemeinde VARCHAR(254) NOT NULL,
    gmdschl VARCHAR(254) NOT NULL,
    uebobjekt VARCHAR(9),
    ueboname VARCHAR(254)
);
CREATE TABLE IF NOT EXISTS "Vereinfachtes Datenaustauschschema".Nutzung (
    oid VARCHAR(18) NOT NULL PRIMARY KEY,
    aktualit DATE NOT NULL,
    geometrie GEOMETRY(MultiPolygon, :DEFAULT_CRS) NOT NULL,
    nutzart VARCHAR(254) NOT NULL,
    bez VARCHAR(254),
    name VARCHAR(254)
);
CREATE TABLE IF NOT EXISTS "Vereinfachtes Datenaustauschschema".NutzungFlurstueck (
    oid VARCHAR(34) NOT NULL PRIMARY KEY,
    aktualit DATE NOT NULL,
    geometrie GEOMETRY(MultiPolygon, :DEFAULT_CRS) NOT NULL,
    nutzart VARCHAR(254) NOT NULL,
    bez VARCHAR(254),
    name VARCHAR(254),
    flstkennz VARCHAR(20) NOT NULL
);
CREATE TABLE IF NOT EXISTS "Vereinfachtes Datenaustauschschema".VerwaltungsEinheit (
    oid VARCHAR(17) NOT NULL PRIMARY KEY,
    aktualit DATE NOT NULL,
    geometrie GEOMETRY(MultiPolygon, :DEFAULT_CRS) NOT NULL,
    art VARCHAR(254) NOT NULL,
    name VARCHAR(254) NOT NULL,
    rs VARCHAR(15),
    ags VARCHAR(11),
    uebobjekt VARCHAR(17),
    ueboname VARCHAR(254)
);