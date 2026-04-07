CREATE TABLE utilisateurs (
utilisateur_id      SERIAL PRIMARY KEY,
nom                 VARCHAR(100) NOT NULL,
email               VARCHAR(255) NOT NULL UNIQUE,
mot_de_passe_hash   VARCHAR(255) NOT NULL,
telephone           VARCHAR(20),
date_inscription    TIMESTAMP NOT NULL DEFAULT NOW(),
consentement_rgpd   BOOLEAN NOT NULL DEFAULT FALSE,
actif               BOOLEAN NOT NULL DEFAULT TRUE,
solde               DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (solde >= 0),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE abonnements (
abonnement_id   SERIAL PRIMARY KEY,
utilisateur_id  SERIAL NOT NULL REFERENCES utilisateurs(utilisateur_id) ON DELETE CASCADE,
type            VARCHAR(20) NOT NULL CHECK (type IN ('pay-as-you-go','mensuel','annuel')),
date_debut      DATE NOT NULL DEFAULT CURRENT_DATE,
date_fin        DATE,
prix    DECIMAL(8,2) NOT NULL DEFAULT 0.00 CHECK (prix >= 0),
actif           BOOLEAN NOT NULL DEFAULT TRUE,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE stations (
station_id             SERIAL PRIMARY KEY,
nom                 VARCHAR(150) NOT NULL,
adresse             VARCHAR(255) NOT NULL,
zone_id             SERIAL NOT NULL REFERENCES zones_metro(zone_id) ON DELETE RESTRICT,
latitude    DECIMAL(10,7) NOT NULL,
longitude   DECIMAL(10,7) NOT NULL,
capacite_totale     INTEGER NOT NULL CHECK (capacite_totale > 0),
places_disponibles  INTEGER NOT NULL CHECK (places_disponibles >= 0),
actif               BOOLEAN NOT NULL DEFAULT TRUE,
CONSTRAINT chk_places CHECK (places_disponibles <= capacite_totale),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE localisation_station (
localisation_station_id          SERIAL PRIMARY KEY,
station_id  SERIAL NOT NULL REFERENCES stations(station_id) ON DELETE CASCADE,
latitude    DECIMAL(10,7) NOT NULL,
longitude   DECIMAL(10,7) NOT NULL,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE vehicules (
vehicule_id             SERIAL PRIMARY KEY,
immatriculation         VARCHAR(20) UNIQUE,
type                    VARCHAR(50) NOT NULL CHECK (type IN ('vélo','trottinette','vélo électrique','voiture')),
statut                  VARCHAR(20) NOT NULL DEFAULT 'disponible'
                            CHECK (statut IN ('disponible','en_service','hors_service','maintenance')),
station_id              SERIAL REFERENCES stations(station_id) ON DELETE SET NULL,
autonomie_km            DECIMAL(6,2) CHECK (autonomie_km >= 0),
derniere_maintenance    DATE,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE trajets (
trajet_id              SERIAL PRIMARY KEY,
utilisateur_id  SERIAL NOT NULL REFERENCES utilisateurs(utilisateur_id) ON DELETE RESTRICT,
vehicule_id     SERIAL NOT NULL REFERENCES vehicules(vehicule_id) ON DELETE RESTRICT,
date_debut      TIMESTAMPTZ NOT NULL,
date_fin        TIMESTAMPTZ,
duree_minutes   INTEGER CHECK (duree_minutes >= 0),
distance_km     DECIMAL(8,3) CHECK (distance_km >= 0),
montant_facture DECIMAL(8,2) CHECK (montant_facture >= 0),
statut          VARCHAR(20) NOT NULL DEFAULT 'en_cours'
                    CHECK (statut IN ('en_cours','terminé','annulé')),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);





CREATE TABLE point_trajets (
point_trajet_id          SERIAL PRIMARY KEY,
trajet_id   SERIAL NOT NULL REFERENCES trajets(trajet_id) ON DELETE CASCADE,
type        VARCHAR(10) NOT NULL CHECK (type IN ('départ','arrivée')),
station_id  SERIAL REFERENCES stations(station_id) ON DELETE SET NULL,
latitude    DECIMAL(10,7) NOT NULL,
longitude   DECIMAL(10,7) NOT NULL,
horodatage  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE paiements (
paiement_id         SERIAL PRIMARY KEY,
trajet_id           SERIAL REFERENCES trajets(trajet_id) ON DELETE SET NULL,
utilisateur_id      SERIAL NOT NULL REFERENCES utilisateurs(utilisateur_id) ON DELETE RESTRICT,
prix                DECIMAL(8,2) NOT NULL CHECK (prix > 0),
methode             VARCHAR(30) NOT NULL
                     CHECK (methode IN ('carte_bancaire','apple_pay','google_pay','solde')),
statut              VARCHAR(20) NOT NULL DEFAULT 'en_attente'
                    CHECK (statut IN ('en_attente','réussi','échoué','remboursé')),
reference_externe   VARCHAR(100),
date_paiement       TIMESTAMP NOT NULL DEFAULT NOW(),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE incidents (
incident_id         SERIAL PRIMARY KEY,
utilisateur_id      SERIAL NOT NULL REFERENCES utilisateurs(utilisateur_id) ON DELETE RESTRICT,
vehicule_id         SERIAL REFERENCES vehicules(vehicule_id) ON DELETE SET NULL,
titre               VARCHAR(200) NOT NULL,
description         TEXT,
statut              VARCHAR(20) NOT NULL DEFAULT 'ouvert'
                     CHECK (statut IN ('ouvert','en_cours','résolu')),
date_signalement    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
date_resolution     TIMESTAMPTZ,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE analyse_secteurs (
analyse_secteur_id          SERIAL PRIMARY KEY,
commune_id                  SERIAL NOT NULL REFERENCES communes(commune_id) ON DELETE CASCADE,
date_analyse                DATE NOT NULL DEFAULT CURRENT_DATE,
demande_vehicules           INTEGER NOT NULL DEFAULT 0 CHECK (demande_vehicules >= 0),
redistribution_vehicules    INTEGER NOT NULL DEFAULT 0,
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE donnees_airs (
donnees_air_id  SERIAL PRIMARY KEY,
station_id      SERIAL REFERENCES stations(station_id) ON DELETE SET NULL,
indice_qualite  DECIMAL(5,2) NOT NULL CHECK (indice_qualite BETWEEN 0 AND 500),
pm25            DECIMAL(6,2) CHECK (pm25 >= 0),
pm10            DECIMAL(6,2) CHECK (pm10 >= 0),
no2             DECIMAL(6,2) CHECK (no2 >= 0),
horodatage      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE donnees_meteos (
donnees_meteo_id    SERIAL PRIMARY KEY,
zone_id             SERIAL REFERENCES zones_metro(zone_id) ON DELETE SET NULL,
temperature_c       DECIMAL(5,2),
humidite_pct        DECIMAL(5,2) CHECK (humidite_pct BETWEEN 0 AND 100),
vitesse_vent_kmh    DECIMAL(5,2) CHECK (vitesse_vent_kmh >= 0),
precipitation_mm    DECIMAL(6,2) CHECK (precipitation_mm >= 0),
condition           VARCHAR(50),
horodatage          TIMESTAMPTZ NOT NULL DEFAULT NOW(),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
    
);

