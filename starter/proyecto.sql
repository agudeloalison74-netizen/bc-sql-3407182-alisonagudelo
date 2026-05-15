-- PROYECTO SEMANAL: Operadores y Filtros
-- Semana 05 — Jardín Botánico

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS plants;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS zones;

-- ============================================
-- CREACIÓN DE TABLAS
-- ============================================

CREATE TABLE zones (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    climate TEXT NOT NULL
);

CREATE TABLE species (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT NOT NULL
);

CREATE TABLE plants (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    scientific_name TEXT NOT NULL,
    height REAL NOT NULL,
    zone_id INTEGER,
    species_id INTEGER,
    FOREIGN KEY(zone_id) REFERENCES zones(id),
    FOREIGN KEY(species_id) REFERENCES species(id)
);

-- ============================================
-- INSERTAR DATOS
-- ============================================

INSERT INTO zones VALUES
(1, 'Zona Tropical', 'Húmedo'),
(2, 'Zona Desértica', 'Seco'),
(3, 'Zona Floral', 'Templado'),
(4, 'Zona Medicinal', 'Templado'),
(5, 'Zona Acuática', 'Húmedo'),
(6, 'Zona Frutal', 'Cálido'),
(7, 'Zona Andina', 'Frío'),
(8, 'Zona Exótica', 'Variable'),
(9, 'Zona Bosque', 'Frío'),
(10, 'Zona Aromática', 'Templado');

INSERT INTO species VALUES
(1, 'Rosáceas', 'Flor'),
(2, 'Cactáceas', 'Cactus'),
(3, 'Orquídeas', 'Flor'),
(4, 'Coníferas', 'Árbol'),
(5, 'Medicinales', 'Medicinal'),
(6, 'Aromáticas', 'Hierba'),
(7, 'Frutales', 'Fruta'),
(8, 'Acuáticas', 'Agua'),
(9, 'Tropicales', 'Tropical'),
(10, 'Exóticas', 'Exótica');

INSERT INTO plants VALUES
(1, 'Rosa Roja', 'Rosa rubiginosa', 1.2, 3, 1),
(2, 'Cactus Verde', 'Cactaceae', 0.5, 2, 2),
(3, 'Orquídea Blanca', 'Orchidaceae alba', 0.4, 1, 3),
(4, 'Pino Azul', 'Pinus sylvestris', 12.5, 9, 4),
(5, 'Aloe Vera', 'Aloe barbadensis', 0.8, 4, 5),
(6, 'Lavanda', 'Lavandula', 0.6, 10, 6),
(7, 'Mango', 'Mangifera indica', 8.0, 6, 7),
(8, 'Nenúfar', 'Nymphaea', 0.3, 5, 8),
(9, 'Palma Tropical', 'Arecaceae', 7.5, 1, 9),
(10, 'Bromelia Roja', 'Bromeliaceae', 0.7, 8, 10),
(11, 'Tulipán Amarillo', 'Tulipa', 0.5, 3, 1),
(12, 'Cerezo Japonés', 'Prunus serrulata', 6.0, 7, 4),
(13, 'Hierbabuena', 'Mentha spicata', 0.4, 10, 6),
(14, 'Papaya', 'Carica papaya', 4.0, 6, 7),
(15, 'Lirio Azul', 'Lilium', 0.9, 3, 1),
(16, 'Roble', 'Quercus robur', 15.0, 9, 4),
(17, 'Menta', 'Mentha', 0.5, 10, 6),
(18, 'Girasol', 'Helianthus annuus', 2.8, 3, 1),
(19, 'Cedro', 'Cedrus', 14.0, 9, 4),
(20, 'Romero', 'Rosmarinus officinalis', 1.1, 10, 6),
(21, 'Bugambilia', 'Bougainvillea', 2.3, 3, 1),
(22, 'Helecho', 'Pteridophyta', 0.9, 1, 9),
(23, 'Azucena', 'Lilium candidum', 0.7, 3, 1),
(24, 'Canela', 'Cinnamomum verum', 5.0, 8, 10),
(25, 'Pasto Marino', 'Zostera marina', 0.2, 5, 8),
(26, 'Limón', 'Citrus limon', 3.5, 6, 7),
(27, 'Jacaranda', 'Jacaranda mimosifolia', 11.0, 9, 4),
(28, 'Orquídea Morada', 'Orchidaceae purple', 0.6, 1, 3),
(29, 'Bambú', 'Bambusoideae', 5.5, 9, 4),
(30, 'Lavanda Azul', 'Lavandula angustifolia', 0.7, 10, 6);

-- ============================================
-- CONSULTA 1: BETWEEN
-- ============================================

SELECT
    name AS "Planta",
    height AS "Altura"
FROM plants
WHERE height BETWEEN 1 AND 5;

-- ============================================
-- CONSULTA 2: IN
-- ============================================

SELECT
    name AS "Planta",
    zone_id AS "Zona"
FROM plants
WHERE zone_id IN (1, 3, 10);

-- ============================================
-- CONSULTA 3: LIKE
-- ============================================

SELECT
    name AS "Planta",
    scientific_name AS "Nombre Científico"
FROM plants
WHERE name LIKE '%Azul%';

-- ============================================
-- CONSULTA 4: FILTRO COMBINADO
-- ============================================

SELECT
    name AS "Planta",
    height AS "Altura",
    zone_id AS "Zona"
FROM plants
WHERE height BETWEEN 0.5 AND 10
AND zone_id IN (1, 3, 10)
AND name LIKE '%a%'
ORDER BY height DESC;