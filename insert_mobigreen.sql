

INSERT INTO trajets
(utilisateur_id, vehicule_id, date_debut, date_fin, duree_minutes, distance_km, montant_facture, statut)
VALUES
(1, 2, '2026-03-25 08:00:00+00', '2026-03-25 08:25:00+00', 25, 6.500, 3.25, 'terminé'),
(2, 3, '2026-03-25 09:10:00+00', '2026-03-25 09:45:00+00', 35, 10.200, 5.10, 'terminé'),
(3, 1, '2026-03-25 10:00:00+00', '2026-03-25 10:15:00+00', 15, 3.000, 1.50, 'terminé'),
(4, 4, '2026-03-25 11:00:00+00', '2026-03-25 11:50:00+00', 50, 25.000, 15.00, 'terminé'),
(5, 6, '2026-03-25 12:30:00+00', '2026-03-25 12:50:00+00', 20, 5.500, 2.75, 'terminé'),
(6, 7, '2026-03-25 13:10:00+00', '2026-03-25 13:40:00+00', 30, 12.000, 6.00, 'terminé'),
(7, 8, '2026-03-25 14:00:00+00', '2026-03-25 14:45:00+00', 45, 30.000, 18.00, 'terminé'),
(8, 9, '2026-03-25 15:00:00+00', '2026-03-25 15:20:00+00', 20, 4.000, 2.00, 'terminé'),
(9, 10, '2026-03-25 16:00:00+00', NULL, NULL, NULL, NULL, 'en_cours'),
(10, 11, '2026-03-25 16:30:00+00', NULL, NULL, NULL, NULL, 'en_cours'),

(1, 12, '2026-03-26 08:00:00+00', '2026-03-26 08:40:00+00', 40, 22.000, 13.20, 'terminé'),
(2, 13, '2026-03-26 09:15:00+00', '2026-03-26 09:35:00+00', 20, 5.000, 2.50, 'terminé'),
(3, 14, '2026-03-26 10:00:00+00', '2026-03-26 10:30:00+00', 30, 8.500, 4.25, 'terminé'),
(4, 15, '2026-03-26 11:00:00+00', '2026-03-26 11:45:00+00', 45, 15.000, 7.50, 'terminé'),
(5, 2, '2026-03-26 12:00:00+00', '2026-03-26 12:10:00+00', 10, 2.000, 1.00, 'terminé'),
(6, 3, '2026-03-26 13:00:00+00', NULL, NULL, NULL, NULL, 'annulé'),
(7, 4, '2026-03-26 14:00:00+00', '2026-03-26 14:20:00+00', 20, 10.000, 6.00, 'terminé'),
(8, 5, '2026-03-26 15:00:00+00', '2026-03-26 15:05:00+00', 5, 1.000, 0.50, 'terminé'),
(9, 6, '2026-03-26 16:00:00+00', '2026-03-26 16:25:00+00', 25, 7.000, 3.50, 'terminé'),
(10, 7, '2026-03-26 17:00:00+00', '2026-03-26 17:35:00+00', 35, 11.000, 5.50, 'terminé');




INSERT INTO zones_metro (nom, code_insee) VALUES
('Grenoble', '38185'),
('Echirolles', '38130'),
('Meylan', '38229'),
('Fontaine', '38158'),
('Saint-Martin-d''Hères', '38363');


INSERT INTO stations (nom, adresse, latitude, longitude, capacite_totale,
places_disponibles, zone_id) VALUES
('Hôtel de Ville', '11 bd. Jean Pain, Grenoble', 45.1860,
5.7244, 12, 5, 1),
('Presqu''île - GIANT', '3 parvis Louis Néel, Grenoble', 45.1940,
5.7068, 18, 10, 1),
('Paul Mistral - Parc', '1 av. Paul Mistral, Grenoble', 45.1799,
5.7293, 16, 9, 1),
('Campus universitaire', '621 av. Centrale, Saint-Martin-d''Hères', 45.1933,
5.7672, 25, 18, 5),
('Échirolles Centre', '1 pl. de la République, Échirolles', 45.1488,
5.7229, 10, 3, 2),
('Meylan - Mairie', '12 rte du Belvédère, Meylan', 45.2095,
5.7731, 10, 7, 3),
('Fontaine - Piscine', '8 rue des Sports, Fontaine', 45.1920,
5.6890, 8, 4, 4);


INSERT INTO utilisateurs 
(nom, email, mot_de_passe_hash, telephone, consentement_rgpd, actif, solde)
VALUES
('Jean Dupont', 'jean.dupont@example.com', 'hash_mdp_1', '0612345678', TRUE, TRUE, 150.50),
('Marie Martin', 'marie.martin@example.com', 'hash_mdp_2', '0623456789', TRUE, TRUE, 200.00),
('Paul Durand', 'paul.durand@example.com', 'hash_mdp_3', '0634567890', FALSE, TRUE, 0.00),
('Sophie Bernard', 'sophie.bernard@example.com', 'hash_mdp_4', '0645678901', TRUE, TRUE, 75.20),
('Lucas Petit', 'lucas.petit@example.com', 'hash_mdp_5', '0656789012', TRUE, FALSE, 10.00),
('Emma Robert', 'emma.robert@example.com', 'hash_mdp_6', '0667890123', TRUE, TRUE, 320.99),
('Hugo Richard', 'hugo.richard@example.com', 'hash_mdp_7', '0678901234', FALSE, TRUE, 5.75),
('Chloé Moreau', 'chloe.moreau@example.com', 'hash_mdp_8', '0689012345', TRUE, TRUE, 89.90),
('Nathan Simon', 'nathan.simon@example.com', 'hash_mdp_9', '0690123456', TRUE, FALSE, 45.00),
('Léa Laurent', 'lea.laurent@example.com', 'hash_mdp_10', '0601234567', TRUE, TRUE, 500.00);


INSERT INTO vehicules 
(immatriculation, type, statut, station_id, autonomie_km, derniere_maintenance)
VALUES
('FR-VEH-001', 'vélo', 'disponible', 1, 0.00, '2026-03-15'),
('FR-VEH-002', 'trottinette', 'en_service', 2, 25.50, '2026-03-20'),
('FR-VEH-003', 'vélo électrique', 'disponible', 1, 60.00, '2026-03-10'),
('FR-VEH-004', 'voiture', 'maintenance', 3, 450.00, '2026-02-28'),
('FR-VEH-005', 'vélo', 'hors_service', 2, 0.00, '2026-01-15'),
('FR-VEH-006', 'trottinette', 'disponible', 4, 30.00, '2026-03-18'),
('FR-VEH-007', 'vélo électrique', 'en_service', 3, 55.00, '2026-03-22'),
('FR-VEH-008', 'voiture', 'disponible', 5, 500.00, '2026-03-05'),
('FR-VEH-009', 'vélo', 'disponible', 1, 0.00, '2026-03-12'),
('FR-VEH-010', 'trottinette', 'maintenance', 2, 20.00, '2026-02-20'),
('FR-VEH-011', 'vélo électrique', 'hors_service', 4, 40.00, '2026-01-30'),
('FR-VEH-012', 'voiture', 'en_service', 3, 380.00, '2026-03-25'),
('FR-VEH-013', 'vélo', 'disponible', 5, 0.00, '2026-03-08'),
('FR-VEH-014', 'trottinette', 'disponible', 1, 28.75, '2026-03-19'),
('FR-VEH-015', 'vélo électrique', 'maintenance', 2, 50.00, '2026-02-27');


INSERT INTO trajets
(utilisateur_id, vehicule_id, date_debut, date_fin, duree_minutes, distance_km, montant_facture, statut)
VALUES
(1, 2, '2026-03-25 08:00:00+00', '2026-03-25 08:25:00+00', 25, 6.500, 3.25, 'terminé'),
(2, 3, '2026-03-25 09:10:00+00', '2026-03-25 09:45:00+00', 35, 10.200, 5.10, 'terminé'),
(3, 1, '2026-03-25 10:00:00+00', '2026-03-25 10:15:00+00', 15, 3.000, 1.50, 'terminé'),
(4, 4, '2026-03-25 11:00:00+00', '2026-03-25 11:50:00+00', 50, 25.000, 15.00, 'terminé'),
(5, 6, '2026-03-25 12:30:00+00', '2026-03-25 12:50:00+00', 20, 5.500, 2.75, 'terminé'),
(6, 7, '2026-03-25 13:10:00+00', '2026-03-25 13:40:00+00', 30, 12.000, 6.00, 'terminé'),
(7, 8, '2026-03-25 14:00:00+00', '2026-03-25 14:45:00+00', 45, 30.000, 18.00, 'terminé'),
(8, 9, '2026-03-25 15:00:00+00', '2026-03-25 15:20:00+00', 20, 4.000, 2.00, 'terminé'),
(9, 10, '2026-03-25 16:00:00+00', NULL, NULL, NULL, NULL, 'en_cours'),
(10, 11, '2026-03-25 16:30:00+00', NULL, NULL, NULL, NULL, 'en_cours'),

(1, 12, '2026-03-26 08:00:00+00', '2026-03-26 08:40:00+00', 40, 22.000, 13.20, 'terminé'),
(2, 13, '2026-03-26 09:15:00+00', '2026-03-26 09:35:00+00', 20, 5.000, 2.50, 'terminé'),
(3, 14, '2026-03-26 10:00:00+00', '2026-03-26 10:30:00+00', 30, 8.500, 4.25, 'terminé'),
(4, 15, '2026-03-26 11:00:00+00', '2026-03-26 11:45:00+00', 45, 15.000, 7.50, 'terminé'),
(5, 2, '2026-03-26 12:00:00+00', '2026-03-26 12:10:00+00', 10, 2.000, 1.00, 'terminé'),
(6, 3, '2026-03-26 13:00:00+00', NULL, NULL, NULL, NULL, 'annulé'),
(7, 4, '2026-03-26 14:00:00+00', '2026-03-26 14:20:00+00', 20, 10.000, 6.00, 'terminé'),
(8, 5, '2026-03-26 15:00:00+00', '2026-03-26 15:05:00+00', 5, 1.000, 0.50, 'terminé'),
(9, 6, '2026-03-26 16:00:00+00', '2026-03-26 16:25:00+00', 25, 7.000, 3.50, 'terminé'),
(10, 7, '2026-03-26 17:00:00+00', '2026-03-26 17:35:00+00', 35, 11.000, 5.50, 'terminé');



INSERT INTO donnees_airs
(station_id, indice_qualite, pm25, pm10, no2, horodatage)
VALUES
(1, 42.50, 12.30, 20.10, 15.00, '2026-04-01 08:00:00+00'),
(2, 65.80, 25.40, 40.20, 30.10, '2026-04-01 09:00:00+00'),
(3, 120.00, 55.00, 80.00, 60.50, '2026-04-01 10:00:00+00'),
(4, 85.30, 30.20, 50.10, 40.00, '2026-04-01 11:00:00+00'),
(5, 15.20, 5.00, 10.00, 8.50, '2026-04-01 12:00:00+00');

INSERT INTO analyse_secteurs
(commune_id, date_analyse, demande_vehicules, redistribution_vehicules)
VALUES
(1, '2026-03-30', 120, 15),
(2, '2026-03-30', 95, 10),
(3, '2026-03-30', 60, -5),
(4, '2026-03-30', 80, 5),
(5, '2026-03-30', 40, -10),

(1, '2026-03-31', 140, 20),
(2, '2026-03-31', 110, 15),
(3, '2026-03-31', 70, -5),
(4, '2026-03-31', 85, 5),
(5, '2026-03-31', 50, -10),

(1, '2026-04-01', 130, 18),
(2, '2026-04-01', 100, 12),
(3, '2026-04-01', 65, -3),
(4, '2026-04-01', 90, 8),
(5, '2026-04-01', 55, -8),

(1, '2026-04-02', 150, 25),
(2, '2026-04-02', 120, 18),
(3, '2026-04-02', 75, -5),
(4, '2026-04-02', 95, 10),
(5, '2026-04-02', 60, -10);

INSERT INTO incidents
(utilisateur_id, vehicule_id, titre, description, statut, date_signalement, date_resolution)
VALUES
(1, 2, 'Problème de frein', 'Les freins de la trottinette ne répondent pas correctement.', 'résolu',
 '2026-03-28 08:30:00+00', '2026-03-28 12:00:00+00'),

(2, 3, 'Batterie faible', 'Le vélo électrique se décharge très rapidement.', 'en_cours',
 '2026-03-29 09:15:00+00', NULL),

(3, 4, 'Panne moteur', 'La voiture ne démarre plus après plusieurs tentatives.', 'ouvert',
 '2026-03-30 10:00:00+00', NULL),

(4, 6, 'Roues endommagées', 'Les roues de la trottinette sont usées et instables.', 'résolu',
 '2026-03-27 14:20:00+00', '2026-03-27 18:45:00+00'),

(5, 1, 'Chaîne cassée', 'La chaîne du vélo s’est cassée pendant le trajet.', 'en_cours',
 '2026-03-31 16:10:00+00', NULL);


INSERT INTO donnees_meteos
(zone_id, temperature_c, humidite_pct, vitesse_vent_kmh, precipitation_mm, condition, horodatage)
VALUES
(1, 12.50, 75.00, 10.20, 0.00, 'nuageux', '2026-04-01 06:00:00+00'),
(1, 14.20, 70.00, 12.00, 0.00, 'partiellement nuageux', '2026-04-01 09:00:00+00'),
(2, 18.00, 65.00, 8.50, 0.00, 'ensoleillé', '2026-04-01 12:00:00+00'),
(2, 17.50, 68.00, 9.00, 0.50, 'averses', '2026-04-01 15:00:00+00'),
(3, 15.00, 80.00, 14.00, 1.20, 'pluie légère', '2026-04-01 18:00:00+00'),
(3, 13.00, 85.00, 11.50, 0.80, 'pluie', '2026-04-01 21:00:00+00'),
(4, 10.50, 90.00, 6.00, 2.50, 'pluie forte', '2026-04-02 00:00:00+00'),
(4, 9.80, 92.00, 5.50, 1.00, 'pluie modérée', '2026-04-02 03:00:00+00'),
(5, 11.20, 88.00, 7.00, 0.20, 'brouillard', '2026-04-02 06:00:00+00'),
(5, 16.00, 72.00, 10.00, 0.00, 'ensoleillé', '2026-04-02 09:00:00+00');
