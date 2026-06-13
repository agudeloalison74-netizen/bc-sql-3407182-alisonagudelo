-- ============================================
-- PROYECTO SEMANAL: JOINs aplicados a tu dominio
-- Semana 09 — INNER JOIN y LEFT JOIN
-- Dominio: Jardín Botánico
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- ELIMINAR TABLAS SI EXISTEN
-- ============================================

DROP TABLE IF EXISTS guides;
DROP TABLE IF EXISTS plants;
DROP TABLE IF EXISTS species;

-- ============================================
-- TABLA DE ESPECIES
-- ============================================

CREATE TABLE species (
    id INTEGER PRIMARY KEY,
    nombre_comun TEXT NOT NULL UNIQUE,
    nombre_cientifico TEXT NOT NULL
);

-- ============================================
-- TABLA DE PLANTAS
-- ============================================

CREATE TABLE plants (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    altura REAL NOT NULL,
    species_id INTEGER,
    FOREIGN KEY (species_id) REFERENCES species(id)
);

-- ============================================
-- TABLA DE GUÍAS
-- ============================================

CREATE TABLE guides (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    fecha_recorrido TEXT NOT NULL,
    plant_id INTEGER,
    FOREIGN KEY (plant_id) REFERENCES plants(id)
);

-- ============================================
-- DATOS DE PRUEBA
-- ============================================

INSERT INTO species VALUES
(1,'Rosa','Rosa gallica'),
(2,'Orquídea','Orchidaceae'),
(3,'Girasol','Helianthus annuus'),
(4,'Lavanda','Lavandula angustifolia'),
(5,'Bambú','Bambusoideae');

INSERT INTO plants VALUES
(1,'Rosa Roja',1.2,1),
(2,'Rosa Blanca',1.1,1),
(3,'Orquídea Azul',0.6,2),
(4,'Orquídea Morada',0.5,2),
(5,'Girasol Gigante',2.3,3),
(6,'Lavanda Francesa',0.8,4),
(7,'Bambú Tropical',5.2,5),
(8,'Rosa Amarilla',1.0,1);

-- La planta 8 quedará sin guía (huérfana)

INSERT INTO guides VALUES
(1,'Carlos Gómez','2026-06-01',1),
(2,'Ana Torres','2026-06-02',2),
(3,'Juan Pérez','2026-06-03',3),
(4,'Laura Díaz','2026-06-04',4),
(5,'Sofía Rojas','2026-06-05',5),
(6,'Miguel Castro','2026-06-06',6),
(7,'Camila Ruiz','2026-06-07',7);

-- ============================================
-- CONSULTA 1: INNER JOIN PRINCIPAL
-- ============================================

SELECT
    p.nombre AS planta,
    g.nombre AS guia,
    g.fecha_recorrido AS fecha
FROM plants p
INNER JOIN guides g
ON p.id = g.plant_id;

-- ============================================
-- CONSULTA 2: JOIN CON TRES TABLAS
-- ============================================

SELECT
    p.nombre AS planta,
    s.nombre_comun AS especie,
    g.nombre AS guia
FROM plants p
INNER JOIN species s
ON p.species_id = s.id
INNER JOIN guides g
ON p.id = g.plant_id;

-- ============================================
-- CONSULTA 3: LEFT JOIN
-- ============================================

SELECT
    p.nombre AS planta,
    g.nombre AS guia
FROM plants p
LEFT JOIN guides g
ON p.id = g.plant_id;

-- ============================================
-- CONSULTA 4: DETECTAR HUÉRFANOS
-- ============================================

SELECT
    p.nombre AS planta_sin_guia
FROM plants p
LEFT JOIN guides g
ON p.id = g.plant_id
WHERE g.id IS NULL;

-- ============================================
-- CONSULTA 5: REPORTE AGREGADO
-- ============================================

SELECT
    p.nombre AS planta,
    COUNT(g.id) AS total_guias
FROM plants p
LEFT JOIN guides g
ON p.id = g.plant_id
GROUP BY p.nombre
ORDER BY total_guias DESC;