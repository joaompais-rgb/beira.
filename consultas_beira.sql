-- ============================================================
-- Preguntas de negocio de la beira. con SQL (MySQL 8)
-- Antes: ejecutar data/interno/beira_mysql.sql (lo genera el notebook 06).
-- Cada consulta se ejecuta con el cursor dentro y Ctrl + Enter.
-- ============================================================
USE beira;


-- 1. Cuándo compran las autarquías (H1)
-- GROUP BY agrupa los contratos por año y mes; SUM suma el gasto y COUNT(*) cuenta los contratos.
SELECT ano, mes, COUNT(*) AS contratos, ROUND(SUM(precio)) AS gasto
FROM contratos
WHERE tipo_comprador IN ('camara', 'junta')
GROUP BY ano, mes
ORDER BY ano, mes;


-- 2. Dónde se gasta más por habitante
-- JOIN une cada contrato con su municipio para dividir el gasto entre la población.
SELECT m.municipio,
       m.poblacion,
       COUNT(*) AS contratos,
       ROUND(SUM(c.precio)) AS gasto,
       ROUND(SUM(c.precio) / m.poblacion, 2) AS gasto_por_habitante
FROM contratos AS c
JOIN municipios AS m ON c.municipio = m.municipio
WHERE c.tipo_comprador IN ('camara', 'junta')
GROUP BY m.municipio, m.poblacion
ORDER BY gasto_por_habitante DESC
LIMIT 10;


-- 3. Proveedores (H2): cuántos hay y qué parte del gasto se llevan los mayores
-- WITH crea una tabla temporal con el gasto de cada proveedor. Las subconsultas de dentro
-- ordenan esa tabla, se quedan con los 3 (o 10) mayores y suman su gasto.
WITH por_proveedor AS (
    SELECT proveedor_id, SUM(precio) AS gasto
    FROM contratos
    WHERE tipo_comprador IN ('camara', 'junta')
    GROUP BY proveedor_id
)
SELECT COUNT(*) AS proveedores,
       ROUND(100 * (SELECT SUM(gasto) FROM (SELECT gasto FROM por_proveedor ORDER BY gasto DESC LIMIT 3) AS mayores_3) / SUM(gasto), 1) AS pct_3_mayores,
       ROUND(100 * (SELECT SUM(gasto) FROM (SELECT gasto FROM por_proveedor ORDER BY gasto DESC LIMIT 10) AS mayores_10) / SUM(gasto), 1) AS pct_10_mayores
FROM por_proveedor;


-- 4. Contacto público por segmento (H3)
-- CASE WHEN convierte cada fila en 1 (tiene email) o 0; la media de unos y ceros es el porcentaje.
SELECT segmento,
       COUNT(*) AS organizaciones,
       ROUND(100 * AVG(CASE WHEN email IS NOT NULL THEN 1 ELSE 0 END), 1) AS pct_email,
       ROUND(100 * AVG(CASE WHEN telefono IS NOT NULL THEN 1 ELSE 0 END), 1) AS pct_telefono
FROM organizaciones
WHERE origen = 'OpenStreetMap'
GROUP BY segmento
ORDER BY organizaciones DESC;


-- 5. Quién vuelve a comprar (H5)
-- HAVING filtra después de agrupar: compradores con contratos en dos años distintos o más.
SELECT comprador_nif,
       municipio,
       COUNT(DISTINCT ano) AS anos_con_compras,
       COUNT(*) AS contratos,
       ROUND(SUM(precio)) AS gasto
FROM contratos
WHERE tipo_comprador IN ('camara', 'junta')
GROUP BY comprador_nif, municipio
HAVING COUNT(DISTINCT ano) >= 2
ORDER BY anos_con_compras DESC, gasto DESC;


-- 6. El piloto: organizaciones por segmento, cercanía y email
SELECT o.segmento,
       COUNT(*) AS organizaciones,
       SUM(CASE WHEN o.km_a_la_base <= 20 THEN 1 ELSE 0 END) AS a_20_km_o_menos,
       SUM(CASE WHEN o.email IS NOT NULL THEN 1 ELSE 0 END) AS con_email
FROM organizaciones AS o
JOIN municipios AS m ON o.municipio = m.municipio
WHERE m.piloto = 1
GROUP BY o.segmento
ORDER BY organizaciones DESC;


-- 7. Concursos públicos anunciados, por año
SELECT ano,
       COUNT(*) AS concursos,
       SUM(CASE WHEN tipo_comprador = 'camara' THEN 1 ELSE 0 END) AS de_camaras,
       ROUND(AVG(dias_para_propuestas)) AS dias_para_propuestas
FROM anuncios
GROUP BY ano
ORDER BY ano;
