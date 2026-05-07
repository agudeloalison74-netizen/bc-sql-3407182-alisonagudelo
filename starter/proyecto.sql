-- ============================================
-- PROYECTO SEMANAL:Jardín Botánico (Semana 03) 
-- ============================================

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
    name TEXT NOT NULL UNIQUE,
    description TEXT
);

CREATE TABLE species (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    climate TEXT NOT NULL
);

CREATE TABLE plants (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    scientific_name TEXT UNIQUE,
    height REAL CHECK(height > 0),
    zone_id INTEGER,
    species_id INTEGER,
    FOREIGN KEY(zone_id) REFERENCES zones(id),
    FOREIGN KEY(species_id) REFERENCES species(id)
);

-- ============================================
-- PARTE 1: INSERT INTO
-- ============================================

-- INSERTAR EN ZONAS
INSERT INTO zones VALUES
(1, 'Zona Floral', 'Plantas decorativas'),
(2, 'Zona Tropical', 'Ambiente húmedo'),
(3, 'Zona Desértica', 'Plantas resistentes'),
(4, 'Zona Medicinal', 'Plantas curativas'),
(5, 'Zona Bosque', 'Árboles grandes');

-- INSERTAR EN ESPECIES
INSERT INTO species VALUES
(1, 'Rosáceas', 'templado'),
(2, 'Cactáceas', 'desértico'),
(3, 'Orquídeas', 'tropical'),
(4, 'Coníferas', 'frío'),
(5, 'Medicinales', 'templado');

-- INSERTAR EN PLANTAS (15 REGISTROS)
INSERT INTO plants VALUES
(1, 'Rosa', 'Rosa rubiginosa', 1.2, 1, 1),
(2, 'Cactus', 'Cactaceae', 0.5, 3, 2),
(3, 'Orquídea Blanca', 'Orchidaceae alba', 0.4, 2, 3),
(4, 'Pino', 'Pinus sylvestris', 10.5, 5, 4),
(5, 'Aloe Vera', 'Aloe barbadensis', 0.7, 4, 5),
(6, 'Lavanda', 'Lavandula', 0.6, 1, 5),
(7, 'Tulipán', 'Tulipa gesneriana', 0.3, 1, 1),
(8, 'Palma', 'Arecaceae', 7.5, 2, 3),
(9, 'Bambú', 'Bambusoideae', 6.0, 5, 4),
(10, 'Menta', 'Mentha', 0.4, 4, 5),
(11, 'Bugambilia', 'Bougainvillea', 2.5, 1, 1),
(12, 'Helecho', 'Pteridophyta', 0.8, 2, 3),
(13, 'Jacaranda', 'Jacaranda mimosifolia', 12.0, 5, 4),
(14, 'Lirio', 'Lilium', 0.5, 1, 1),
(15, 'Girasol', 'Helianthus annuus', 2.8, 1, 1);

-- ============================================
-- PARTE 2: UPDATE
-- ============================================

-- Actualizar una fila específica usando PK
UPDATE plants
SET height = 1.5
WHERE id = 1;

-- Actualizar múltiples columnas
UPDATE plants
SET name = 'Cactus Gigante',
    height = 1.2
WHERE id = 2;

-- Actualizar múltiples filas por condición
UPDATE plants
SET height = height + 0.5
WHERE zone_id = 1;

-- ============================================
-- PARTE 3: DELETE SEGURO
-- ============================================

-- Verificar qué filas serán eliminadas
SELECT id, name
FROM plants
WHERE height < 0.5;

-- Eliminar filas con el mismo WHERE
DELETE FROM plants
WHERE height < 0.5;

-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================

SELECT * FROM zones ORDER BY id;
SELECT * FROM species ORDER BY id;
SELECT * FROM plants ORDER BY id;