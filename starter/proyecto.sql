-- ============================================
-- PROYECTO SEMANAL: NULL y Constraints
-- Semana 07 — NOT NULL, UNIQUE, CHECK, FK
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS plants;
DROP TABLE IF EXISTS species;

-- ============================================
-- TABLA SPECIES
-- ============================================

CREATE TABLE species (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    family TEXT NOT NULL
);

-- ============================================
-- TABLA PLANTS
-- ============================================

CREATE TABLE plants (
    id INTEGER PRIMARY KEY,
    common_name TEXT NOT NULL,

    plant_code TEXT NOT NULL UNIQUE,

    height_cm REAL NOT NULL
        CHECK (height_cm > 0),

    status TEXT NOT NULL DEFAULT 'Activa',

    notes TEXT,

    species_id INTEGER NOT NULL
        REFERENCES species(id)
        ON DELETE RESTRICT
);

-- ============================================
-- DATOS DE PRUEBA
-- ============================================

INSERT INTO species (id, name, family)
VALUES
    (1, 'Rosa Gallica', 'Rosaceae'),
    (2, 'Helianthus Annuus', 'Asteraceae'),
    (3, 'Lavandula Angustifolia', 'Lamiaceae');

INSERT INTO plants
(id, common_name, plant_code, height_cm, status, notes, species_id)
VALUES
    (1, 'Rosa Roja', 'PL001', 80, 'Activa', 'Flor ornamental', 1),

    (2, 'Rosa Blanca', 'PL002', 75, 'Activa', NULL, 1),

    (3, 'Girasol Gigante', 'PL003', 220, 'Activa', 'Zona central', 2),

    (4, 'Girasol Amarillo', 'PL004', 180, 'Activa', NULL, 2),

    (5, 'Lavanda Francesa', 'PL005', 60, 'Activa', 'Aroma intenso', 3),

    (6, 'Lavanda Azul', 'PL006', 55, 'Activa', NULL, 3);

-- ============================================
-- CONSULTA 1: IS NULL
-- ============================================

SELECT
    id,
    common_name
FROM plants
WHERE notes IS NULL;

-- ============================================
-- CONSULTA 2: COALESCE
-- ============================================

SELECT
    common_name AS planta,
    COALESCE(notes, 'Sin observaciones') AS observaciones
FROM plants;