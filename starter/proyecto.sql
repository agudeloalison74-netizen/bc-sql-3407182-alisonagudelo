-- ============================================
-- PROYECTO SEMANAL: Jardín Botánico
-- ============================================

-- ============================================
-- PASO 1: Entidad principal (plants)
-- ============================================

CREATE TABLE plants (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    scientific_name TEXT,
    height REAL,
    zone_id INTEGER
);

-- ============================================
-- PASO 2: Otras entidades
-- ============================================

CREATE TABLE species (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    climate TEXT
);

CREATE TABLE zones (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE guides (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    experience_years INTEGER
);

-- ============================================
-- PASO 3: INSERTAR DATOS
-- ============================================

-- 🌿 PLANTS (15 registros)
INSERT INTO plants VALUES
(1, 'Rosa', 'Rosa rubiginosa', 1.2, 1),
(2, 'Girasol', 'Helianthus annuus', 3.0, 2),
(3, 'Cactus', 'Cactaceae', 0.5, 3),
(4, 'Orquídea', 'Orchidaceae', 0.4, 1),
(5, 'Helecho', 'Pteridophyta', 0.8, 2),
(6, 'Lavanda', 'Lavandula', 0.6, 1),
(7, 'Bambú', 'Bambusoideae', 6.0, 3),
(8, 'Tulipán', 'Tulipa', 0.3, 1),
(9, 'Pino', 'Pinus', 10.0, 2),
(10, 'Palma', 'Arecaceae', 8.0, 3),
(11, 'Menta', 'Mentha', 0.4, 1),
(12, 'Aloe Vera', 'Aloe barbadensis', 0.5, 3),
(13, 'Bugambilia', 'Bougainvillea', 2.5, 2),
(14, 'Jacaranda', 'Jacaranda mimosifolia', 12.0, 2),
(15, 'Lirio', 'Lilium', 0.7, 1);

-- ESPECIES (5 registros)
INSERT INTO species VALUES
(1, 'Rosáceas', 'Templado'),
(2, 'Asteráceas', 'Cálido'),
(3, 'Cactáceas', 'Desértico'),
(4, 'Orquídeas', 'Tropical'),
(5, 'Coníferas', 'Frío');

-- ZONAS (5 registros)
INSERT INTO zones VALUES
(1, 'Zona Floral', 'Plantas decorativas y flores'),
(2, 'Zona Bosque', 'Árboles y plantas grandes'),
(3, 'Zona Desértica', 'Plantas resistentes a sequía'),
(4, 'Zona Tropical', 'Ambiente húmedo y cálido'),
(5, 'Zona Medicinal', 'Plantas con propiedades curativas');

-- GUIAS (5 registros)
INSERT INTO guides VALUES
(1, 'Carlos Pérez', 5),
(2, 'Ana Gómez', 3),
(3, 'Luis Martínez', 8),
(4, 'Sofía Ramírez', 2),
(5, 'Jorge Torres', 6);

-- ============================================
-- PASO 4: CONSULTAS SELECT
-- ============================================

-- Mostrar todas las plantas
SELECT * FROM plants;

-- Mostrar nombres de plantas ordenadas
SELECT name
FROM plants
ORDER BY name;

-- Contar plantas
SELECT COUNT(*) AS total_plantas
FROM plants;

-- Mostrar plantas de una zona específica
SELECT name, zone_id
FROM plants
WHERE zone_id = 1;

-- Mostrar guías con más de 5 años de experiencia
SELECT name, experience_years
FROM guides
WHERE experience_years > 5;