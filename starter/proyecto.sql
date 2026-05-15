
-- PROYECTO SEMANAL: Consultas SELECT
-- Semana 04 — Jardín Botánico


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
    description TEXT
);

CREATE TABLE species (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    climate TEXT NOT NULL
);

CREATE TABLE plants (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    scientific_name TEXT,
    height REAL,
    zone_id INTEGER,
    species_id INTEGER,
    FOREIGN KEY(zone_id) REFERENCES zones(id),
    FOREIGN KEY(species_id) REFERENCES species(id)
);

-- ============================================
-- INSERCCIÓN DE DATOS
-- ============================================

INSERT INTO zones VALUES
(1, 'Zona Floral', 'Flores decorativas'),
(2, 'Zona Tropical', 'Ambiente húmedo'),
(3, 'Zona Desértica', 'Plantas resistentes'),
(4, 'Zona Medicinal', 'Plantas curativas'),
(5, 'Zona Bosque', 'Árboles grandes'),
(6, 'Zona Acuática', 'Plantas de agua'),
(7, 'Zona Andina', 'Plantas de montaña'),
(8, 'Zona Exótica', 'Especies raras'),
(9, 'Zona Frutal', 'Árboles frutales'),
(10, 'Zona Aromática', 'Plantas aromáticas');

INSERT INTO species VALUES
(1, 'Rosáceas', 'templado'),
(2, 'Cactáceas', 'desértico'),
(3, 'Orquídeas', 'tropical'),
(4, 'Coníferas', 'frío'),
(5, 'Medicinales', 'templado'),
(6, 'Aromáticas', 'templado'),
(7, 'Frutales', 'cálido'),
(8, 'Acuáticas', 'húmedo'),
(9, 'Tropicales', 'tropical'),
(10, 'Exóticas', 'variable');

-- 30 REGISTROS EN PLANTS
INSERT INTO plants VALUES
(1, 'Rosa', 'Rosa rubiginosa', 1.2, 1, 1),
(2, 'Cactus', 'Cactaceae', 0.5, 3, 2),
(3, 'Orquídea Blanca', 'Orchidaceae alba', 0.4, 2, 3),
(4, 'Pino', 'Pinus sylvestris', 10.5, 5, 4),
(5, 'Aloe Vera', 'Aloe barbadensis', 0.7, 4, 5),
(6, 'Lavanda', 'Lavandula', 0.6, 10, 6),
(7, 'Tulipán', 'Tulipa gesneriana', 0.3, 1, 1),
(8, 'Palma', 'Arecaceae', 7.5, 2, 9),
(9, 'Bambú', 'Bambusoideae', 6.0, 5, 4),
(10, 'Menta', 'Mentha', 0.4, 10, 6),
(11, 'Bugambilia', 'Bougainvillea', 2.5, 1, 1),
(12, 'Helecho', 'Pteridophyta', 0.8, 2, 9),
(13, 'Jacaranda', 'Jacaranda mimosifolia', 12.0, 5, 4),
(14, 'Lirio', 'Lilium', 0.5, 1, 1),
(15, 'Girasol', 'Helianthus annuus', 2.8, 1, 1),
(16, 'Cedro', 'Cedrus', 15.0, 5, 4),
(17, 'Nenúfar', 'Nymphaea', 0.3, 6, 8),
(18, 'Romero', 'Rosmarinus officinalis', 1.0, 10, 6),
(19, 'Mango', 'Mangifera indica', 9.0, 9, 7),
(20, 'Limón', 'Citrus limon', 4.0, 9, 7),
(21, 'Cerezo', 'Prunus avium', 5.5, 7, 1),
(22, 'Eucalipto', 'Eucalyptus', 14.0, 5, 4),
(23, 'Bromelia', 'Bromeliaceae', 0.7, 8, 10),
(24, 'Papaya', 'Carica papaya', 3.5, 9, 7),
(25, 'Orquídea Morada', 'Orchidaceae purple', 0.5, 2, 3),
(26, 'Azucena', 'Lilium candidum', 0.6, 1, 1),
(27, 'Pasto Marino', 'Zostera marina', 0.2, 6, 8),
(28, 'Canela', 'Cinnamomum verum', 6.5, 8, 10),
(29, 'Hierbabuena', 'Mentha spicata', 0.4, 10, 6),
(30, 'Roble', 'Quercus robur', 18.0, 5, 4);

-- ============================================
-- CONSULTA 1: Listado general
-- ============================================

SELECT
    id AS "ID Planta",
    name AS "Nombre Planta",
    scientific_name AS "Nombre Científico",
    height AS "Altura"
FROM plants;

-- ============================================
-- CONSULTA 2: Filtro simple
-- ============================================

SELECT
    name AS "Planta",
    height AS "Altura"
FROM plants
WHERE height > 5;

-- ============================================
-- CONSULTA 3: Filtro combinado
-- ============================================

SELECT
    name AS "Planta",
    zone_id AS "Zona",
    height AS "Altura"
FROM plants
WHERE zone_id = 1
AND height > 1;

-- ============================================
-- CONSULTA 4: ORDER BY + LIMIT
-- ============================================

SELECT
    name AS "Planta",
    height AS "Altura"
FROM plants
ORDER BY height DESC
LIMIT 5;

-- ============================================
-- CONSULTA 5: PAGINACIÓN
-- ============================================

-- Página 1
SELECT
    id AS "ID",
    name AS "Planta"
FROM plants
ORDER BY name ASC
LIMIT 3 OFFSET 0;

-- Página 2
SELECT
    id AS "ID",
    name AS "Planta"
FROM plants
ORDER BY name ASC
LIMIT 3 OFFSET 3;
