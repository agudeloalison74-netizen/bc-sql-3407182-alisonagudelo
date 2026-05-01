-- ============================================
-- PROYECTO SEMANAL: Jardín Botánico (Semana 2)
-- ============================================

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS plants;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS zones;

-- ============================================
-- TABLA 1: plants (principal)
-- ============================================

CREATE TABLE IF NOT EXISTS plants (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    scientific_name TEXT UNIQUE,
    height REAL CHECK (height > 0),
    is_active INTEGER NOT NULL DEFAULT 1,
    zone_id INTEGER,
    FOREIGN KEY (zone_id) REFERENCES zones(id)
);

-- ============================================
-- TABLA 2: species
-- ============================================

CREATE TABLE IF NOT EXISTS species (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    climate TEXT NOT NULL DEFAULT 'templado'
);

-- ============================================
-- TABLA 3: zones
-- ============================================

CREATE TABLE IF NOT EXISTS zones (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    description TEXT
);

-- ============================================
-- INSERTAR (DATOS)
-- ============================================

-- ZONAS
INSERT INTO zones VALUES
(1, 'Zona Floral', 'Flores y plantas decorativas'),
(2, 'Zona Bosque', 'Árboles grandes'),
(3, 'Zona Desértica', 'Plantas resistentes'),
(4, 'Zona Tropical', 'Ambiente húmedo'),
(5, 'Zona Medicinal', 'Plantas curativas');

-- ESPECIES
INSERT INTO species VALUES
(1, 'Rosáceas', 'templado'),
(2, 'Asteráceas', 'cálido'),
(3, 'Cactáceas', 'desértico'),
(4, 'Orquídeas', 'tropical'),
(5, 'Coníferas', 'frío');

-- PLANTAS (15 registros)
INSERT INTO plants VALUES
(1, 'Rosa', 'Rosa rubiginosa', 1.2, 1, 1),
(2, 'Girasol', 'Helianthus annuus', 3.0, 1, 2),
(3, 'Cactus', 'Cactaceae', 0.5, 1, 3),
(4, 'Orquídea', 'Orchidaceae', 0.4, 1, 1),
(5, 'Helecho', 'Pteridophyta', 0.8, 1, 2),
(6, 'Lavanda', 'Lavandula', 0.6, 1, 1),
(7, 'Bambú', 'Bambusoideae', 6.0, 1, 3),
(8, 'Tulipán', 'Tulipa', 0.3, 1, 1),
(9, 'Pino', 'Pinus', 10.0, 1, 2),
(10, 'Palma', 'Arecaceae', 8.0, 1, 3),
(11, 'Menta', 'Mentha', 0.4, 1, 5),
(12, 'Aloe Vera', 'Aloe barbadensis', 0.5, 1, 3),
(13, 'Bugambilia', 'Bougainvillea', 2.5, 1, 2),
(14, 'Jacaranda', 'Jacaranda mimosifolia', 12.0, 1, 2),
(15, 'Lirio', 'Lilium', 0.7, 1, 1);

-- ============================================
-- VERIFICACIÓN
-- ============================================

-- .tables
-- PRAGMA table_info(plants);
-- PRAGMA table_info(species);
-- PRAGMA table_info(zones);