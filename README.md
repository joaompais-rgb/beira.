# beira. · ¿Dónde, cuándo y a quién proponer primero?

Proyecto 1 de la Unit 4 (Data Wrangling and Retrieval) · Ironhack Data Analytics · João Miguel Pais

**beira.** es una marca de ropa personalizada con base en Oliveira do Hospital (distrito de Coimbra). Trabaja con tres ofertas: **Equipas** (clubes y grupos), **Eventos** (fiestas y actividades) y **Trabajo** (ropa de trabajo de empresas y entidades). La producción tarda 2 semanas.

Kanban del proyecto: *(enlace de Trello)*

## Pregunta de negocio

> ¿Dónde, cuándo y a quién debe la marca proponer primero sus prendas, y con qué idea?

La región estudiada son 66 municipios de los distritos de Coimbra (17), Viseu (24), Guarda (14) y Castelo Branco (11). El piloto son 6 municipios: Oliveira do Hospital, Arganil, Carregal do Sal, Nelas, Seia y Tábua.

## Respuesta corta

- **A quién.** Cámaras, juntas, colegios y bomberos aparecen en los datos públicos y se pueden contactar. Los clubes y asociaciones pequeños, que son el núcleo de la marca, casi no aparecen: 4 de los 5 clientes actuales no están en ninguna fuente pública. Para ellos el piloto tiene que generar datos propios.
- **Dónde.** Empezar cerca de casa. A 60 km o menos de Oliveira do Hospital están el 63 % de las organizaciones y el 49 % del gasto público en ropa de las autarquías, con 11 compradores públicos que compran varios años seguidos (2,23 M€ en 2020-2025).
- **Cuándo.** Las compras públicas no tienen un mes fijo, pero las fiestas sí: 27 de los 66 festivos municipales caen en junio o septiembre, y 22 de las 30 fiestas de aldea de Oliveira do Hospital son de junio a agosto. Con 2 semanas de producción, el contacto se hace entre 4 y 8 semanas antes de cada fiesta. Las cámaras, en cambio, no compran ropa en los dos meses antes de su festivo: el festivo es un gancho para clubes, asociaciones y juntas, no un calendario de compras públicas.
- **Con qué idea.** Merchandising y prendas para eventos con las autarquías; equipaciones con los clubes. Cada comprador público tiende a repetir proveedor, así que hay que darse a conocer antes de que se abra la compra.

## Hipótesis

| | Hipótesis | Resultado | Cómo se comprueba |
|---|---|---|---|
| H1 | Las compras públicas de ropa se concentran en ciertos meses | **No hay un mes fijo.** El mes de más gasto coincide en 3 de 6 años, algo que el azar da un 19 % de las veces (p = 0,19). Los contratos sí se reparten de forma desigual (p = 0,004) y julio es el mes con más gasto total. | Simulación (permutaciones) y chi-cuadrado simulado |
| H2 | Pocos proveedores ganan la mayor parte de los contratos | **No se cumple.** 150 proveedores: los 3 mayores se llevan el 14,9 % del gasto y los 10 mayores el 32,1 %. | Cuota acumulada |
| H3 | Menos de la mitad de los clientes potenciales tiene email público | **Se cumple.** 45 % con email, pero solo el 7 % si se quitan los colegios (clubes 8 %, asociaciones 6 %, cámaras y juntas 6 %). | Proporciones por segmento |
| H4 | Los festivos municipales se concentran en pocos meses | **Se cumple.** 27 de 66 en junio o septiembre. | Conteo por mes |
| H5 | Las entidades públicas repiten proveedor de un año a otro | **Se cumple.** 21 de las 32 autarquías que compran varios años repiten proveedor; al azar saldrían 5,9 (p < 0,01). | Simulación (permutaciones) |

## Resultados principales

| Gráfico | Qué muestra |
|---|---|
| [Gasto por mes y año](figuras/h1_gasto_mes_ano.png) | H1: el mes de más gasto cambia de un año a otro |
| [Concentración de proveedores](figuras/h2_concentracion.png) | H2: el gasto está repartido entre muchos proveedores |
| [Email por segmento](figuras/h3_email_por_segmento.png) | H3: fuera de los colegios, casi nadie publica email |
| [Calendario comercial](figuras/calendario_comercial.png) | Contratos, festivos, fiestas y búsquedas, mes a mes |
| [Festivos por mes](figuras/h4_festivos_por_mes.png) | H4: junio y septiembre |
| [Contratos y festivos](figuras/dias_hasta_festivo.png) | Los contratos no se acumulan antes del festivo de su municipio |
| [Fiestas de Oliveira do Hospital](figuras/festas_oliveira_hospital.png) | Fiestas de aldea, de junio a agosto |
| [Google Trends](figuras/google_trends_meses.png) | Cuándo se busca cada producto en Portugal |
| [Índice de oportunidad](figuras/indice_oportunidad_top15.png) | Los 15 municipios con más puntos |
| [Qué compran](figuras/productos.png) | Merchandising y ropa de trabajo dominan |
| [Plazos de entrega](figuras/plazos_entrega.png) | Plazo mediano de 44 días; el 18 % da 14 días o menos |
| [Gasto por habitante (SQL)](figuras/sql_gasto_por_habitante.png) | Consulta SQL con JOIN entre contratos y municipios |
| [Diagrama de la base de datos](figuras/diagrama_base_datos.png) | Las cuatro tablas de MySQL y sus relaciones |

Otros resultados:

- **Compras públicas (Portal BASE, 2020-2025).** Cámaras y juntas de la región firmaron 265 contratos de ropa y merchandising por 4,92 M€. Dominan el merchandising (2,59 M€) y la ropa de trabajo (1,53 M€); las prendas de equipo (camisetas, ropa deportiva, polos, sudaderas y gorras) son 28 contratos y 388 mil €.
- **Cómo compran.** El 88 % de los contratos es por invitación (consulta previa o ajuste directo). En la consulta previa se presentan de mediana 2 empresas. Las PME ganaron el 67 % (2024) y el 78 % (2025) de los contratos.
- **Concursos anunciados.** 110 anuncios de ropa y merchandising de compradores de la región, 14 de ellos de cámaras. Dan de mediana 25 días para presentar propuesta, y el plazo medio ha bajado de 30-35 días (2020-2022) a 14-19 días (2023-2025).
- **Competencia.** El INE cuenta 361 empresas de confección y 178 de impresión en la región (2022); 19 municipios no tienen ninguna gráfica. Los proveedores cuyo nombre dice gráfica, estampagem, publicidad, personalización, bordados o fardamento se llevan el 19 % del gasto público.
- **Índice de oportunidad.** Con los pesos que priorizan la cercanía, el piloto queda bien situado (Nelas 2.º, Arganil 5.º, Carregal do Sal 6.º, Tábua 12.º, Oliveira do Hospital 20.º; Seia 44.º). Con pesos iguales, el top 10 solo coincide en 5 municipios: el índice ordena a grandes rasgos, no elige un municipio concreto.
- **Contratos y festivos.** El 15,8 % de los contratos de las autarquías se firma en los 60 días antes del festivo de su municipio; barajando los festivos entre municipios sale el 17,6 % (p = 0,71). La fecha del contrato es posterior a la decisión de compra, y las compras pequeñas no se ven.
- **La lista de contactos.** Cada organización lleva una puntuación, un hecho real para abrir la conversación (la última compra de su cámara o el próximo festivo), una idea de prenda y las fechas de los tres contactos. Con otros pesos se mantienen 23 de los 30 primeros del piloto.
- **Clubes.** Entre 20,5 y 24,0 futbolistas federados por 1.000 habitantes según el distrito: actividad parecida en los cuatro.

## Fuentes de datos

| Fuente | Cómo se obtiene | Qué aporta | Licencia o condiciones | Notebook |
|---|---|---|---|---|
| [OpenStreetMap](https://www.openstreetmap.org) ([API Overpass](https://wiki.openstreetmap.org/wiki/Overpass_API)) | API, una consulta por municipio; prueba tres servidores públicos y retoma donde se quedó | Organizaciones (autarquías, colegios, clubes, asociaciones, bomberos, instalaciones deportivas), negocios para la oferta Trabajo y competencia | [ODbL 1.0](https://opendatacommons.org/licenses/odbl/), © colaboradores de OpenStreetMap | 01, 02, 04 |
| [INE](https://www.ine.pt) ([API JSON](https://www.ine.pt/ine/json_indicador/pindica.jsp)) | API | Población por edad 2023 (0008273); empresas del sector por región NUTS III (0008466); empresas por división CAE y municipio, 2022 (0008511); futbolistas federados por distrito (0008036) | Datos públicos del INE, citando la fuente | 02, 04 |
| [Portal BASE, contratos](https://dados.gov.pt/datasets/contratos-publicos-portal-base-impic-contratos-de-2012-a-2026) (IMPIC, dados.gov.pt) | Descarga de un Excel por año | Contratos públicos 2020-2025 | other-pd, según dados.gov.pt | 02 |
| [Portal BASE, anuncios](https://dados.gov.pt/datasets/contratos-publicos-portal-base-impic-anuncios-de-2012-a-2026) (IMPIC, dados.gov.pt) | Descarga de un Excel por año | Procedimientos anunciados 2020-2025 | other-pd, según dados.gov.pt | 04 |
| [Wikipedia, «Feriados em Portugal»](https://pt.wikipedia.org/wiki/Feriados_em_Portugal) | Web scraping con BeautifulSoup | Festivo municipal de los 66 municipios, con fechas fijas y móviles | [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/) | 02 |
| [Google Trends](https://trends.google.com) | Exportación manual en CSV (Portugal, 5 años) | Meses en los que se busca cada producto | Condiciones de Google; índice relativo de 0 a 100 | 05 |
| Fiestas de aldea de Oliveira do Hospital | Recogida manual en fuentes públicas | Fecha de 30 fiestas de verano | Archivo interno | 05 |
| Datos de la marca | Excel del autor | Clientes para la prueba retroactiva y capacidad de producción | Archivo interno | 05 |

### Fuentes que se intentaron y no entraron

- **Listas de clubes de las asociaciones distritales de fútbol.** Las webs devolvieron errores HTTP y no se insistió. En su lugar se usa el número de futbolistas federados por distrito (INE).
- **Contactos de las cámaras en la web de la CCDR Centro.** El robots.txt no permite recogerlos.
- **Fondo de Financiación de las Freguesias ([Presupuesto del Estado 2026, Lei 73-A/2025](https://info.portaldasfinancas.gov.pt/pt/informacao_fiscal/legislacao/diplomas_legislativos/Documents/lei-73-a-2025.pdf)).** El mapa con lo que recibe cada freguesia no viene en el PDF publicado; el mapa que sí se pudo leer (transferencia de competencias, DL 57/2019) solo cubre 37 de los 66 municipios.
- **Actividades CAE de 5 cifras por municipio (INE).** No se publican; se usan las divisiones de 2 cifras por municipio (2022) y las actividades por región NUTS III.
- **Competencia en OpenStreetMap.** No registra ninguna bordadora ni imprenta en la región. La competencia se mide con el INE y con los proveedores del BASE.
- **Airtable de la marca.** Necesita inicio de sesión y no hace falta para responder a la pregunta.

## Estructura del repositorio

```
main.py                     función principal: regenera la limpieza y la lista de contactos con los datos guardados
config.yaml                 región, piloto, fuentes, filtros, pesos del índice y de la lista
src/
  recoleccion.py            peticiones a las APIs, descargas y scraping (todo se guarda en data/raw)
  cleaning.py               limpieza y unión de fuentes, con assert en cada paso; limpiar_todo() las llama en orden
  analisis.py               pruebas de hipótesis, índice de oportunidad y puntuación de contactos
  graficos.py               estilo de la marca y funciones de gráficos
  base_datos.py             base SQLite y exportación a MySQL
notebooks/
  01_pruebas_extraccion     prueba de cada fuente con un municipio
  02_recogida_region        recogida de los 66 municipios
  03_limpieza               limpieza, unión y tabla final por municipio
  04_recogida_opcional      recogidas lentas o de prueba (competencia, oferta Trabajo, gráficas, anuncios, INE)
  05_analisis               hipótesis, índice, lista de contactos, guía de abordaje y conclusiones
  06_sql                    las preguntas de negocio en SQL y exportación a MySQL
sql/consultas_beira.sql     consultas para MySQL Workbench
figuras/                    gráficos para los slides
data/raw/                   respuestas originales (no se publica)
data/clean/                 tablas limpias (solo se publican las que no tienen contactos)
data/interno/               archivos con contactos, proveedores o datos de la marca (no se publica)
```

## Cómo ejecutarlo

1. Instalar las librerías: `pip install -r requirements.txt`.
2. Con los datos ya guardados en `data/raw/`, `python main.py` regenera en unos segundos las tablas limpias y la lista de contactos del piloto. Usa `cleaning.limpiar_todo`, la función principal de la limpieza, que llama a las demás en orden. Para la demostración basta con cambiar la lista `piloto` de `config.yaml` y volver a ejecutarlo.
3. Para recoger y analizar desde el principio, ejecutar los notebooks en este orden: **02 → 04 → 03 → 05 → 06** (el 01 es solo de prueba).
   - Cada respuesta se guarda en `data/raw/`; si el archivo ya existe no se vuelve a pedir, así que repetir un notebook solo descarga lo que falta.
   - La descarga del BASE (un Excel de decenas de MB por año) y las consultas a OpenStreetMap son las partes lentas.
   - Algunas celdas del 05 usan archivos internos (clientes, fiestas, exclusiones) que no se publican.
4. MySQL Workbench:
   - El notebook 06 escribe `data/interno/beira_mysql.sql`. En Workbench, *File > Open SQL Script*, abrirlo y ejecutarlo entero (icono del rayo). Crea la base `beira` con cuatro tablas, sus claves primarias y las relaciones.
   - Abrir `sql/consultas_beira.sql` y ejecutar cada consulta con el cursor dentro y Ctrl + Enter.

## Limpieza

- **OpenStreetMap:** 1.824 elementos → 235 sin nombre eliminados → 37 duplicados eliminados → 1.552 organizaciones. Se añaden 44 juntas que OpenStreetMap no tiene, a partir de los límites de las freguesias del piloto (sin contacto): 1.596 en total. Las instalaciones deportivas cuyo nombre es el de un club pasan al segmento club.
- **Portal BASE:** 12.350 contratos del primer filtro (ropa y artículos promocionales, todo el país) → 12.292 sin duplicados → 7.265 que encajan con el catálogo de la marca → 485 en la región → 265 de cámaras y juntas. Se excluyen por código CPV y por palabras los equipos de protección, calzado, ropa hospitalaria, formación y el Bordado de Castelo Branco (artesanía), y se eliminan los acuerdos marco publicados a 0 € sin proveedor. Cada proveedor se identifica por su NIF (o por el nombre normalizado si no lo tiene), porque el mismo proveedor aparece escrito de varias formas.
- **Wikipedia:** cuando varios festivos comparten fecha la celda ocupa varias filas (rowspan) y faltaban 12 municipios; corregido, 66 de 66. Las fechas móviles se calculan a partir de la Pascua.
- **INE:** se comprueba con los metadatos qué código es cada categoría antes de usarla.
- **Comprobaciones:** cada función de limpieza termina con `assert`: sin nombres vacíos ni duplicados, segmentos válidos, coordenadas y municipios dentro de la región, precios positivos, proveedor identificado y ningún municipio perdido en las uniones. Los municipios sin dato quedan vacíos (NA), no a 0.

## Diccionario de datos

### `data/clean/municipios.csv` (66 filas, una por municipio)

| Columna | Descripción | Fuente |
|---|---|---|
| `municipio` | Nombre del municipio (clave) | config |
| `distrito` | Distrito | config |
| `piloto` | True si es uno de los 6 municipios del piloto | config |
| `autarquia`, `escuela`, `club`, `asociacion`, `bomberos`, `instalacion_deportiva` | Organizaciones de cada segmento | OpenStreetMap |
| `total_organizaciones` | Suma de los segmentos | OpenStreetMap |
| `con_email` | Organizaciones con email público | OpenStreetMap |
| `organizaciones_por_1000_hab` | Organizaciones por cada 1.000 habitantes | calculada |
| `km_a_la_base` | Distancia mediana en línea recta de sus organizaciones a Oliveira do Hospital (km) | calculada |
| `poblacion` | Habitantes, 2023 | INE 0008273 |
| `poblacion_5_24`, `poblacion_65_mas` | Habitantes de 5 a 24 años y de 65 o más | INE 0008273 |
| `pct_5_24`, `pct_65_mas` | Los mismos grupos en % de la población | calculada |
| `nombre_festivo` | Nombre del festivo municipal | Wikipedia |
| `tipo_fecha` | `fija` o `movil` (depende de la Pascua) | Wikipedia |
| `fecha_2026`, `fecha_2027` | Fecha del festivo en 2026 y 2027 | Wikipedia, calculada |
| `nuts3`, `region_nuts3` | Código y nombre de la región NUTS III | INE |
| `empresas_sector` | Empresas de las 7 actividades CAE del sector en su región NUTS III (cada municipio hereda la de su región) | INE 0008466 |
| `empresas_por_10000_hab` | Las mismas, por cada 10.000 habitantes de la región | calculada |
| `contratos_publicos_ropa`, `gasto_publico_ropa` | Contratos de ropa y merchandising de todos los compradores públicos del municipio, 2020-2025, y su importe (€) | Portal BASE |
| `contratos_autarquias_ropa`, `gasto_autarquias_ropa` | Lo mismo, solo cámaras y juntas | Portal BASE |
| `ine_vestuario_2022`, `ine_impresion_2022` | Empresas de confección de ropa (CAE 14) e impresión (CAE 18) en el municipio, 2022 | INE 0008511 |
| `ine_alojamiento_2022`, `ine_restauracion_2022`, `ine_salud_2022`, `ine_apoyo_social_con_alojamiento_2022`, `ine_apoyo_social_sin_alojamiento_2022` | Empresas de alojamiento (55), restauración (56), salud (86) y apoyo social con alojamiento (87) y sin alojamiento (88), 2022: mercado de la oferta Trabajo | INE 0008511 |
| `competencia_bordado`, `competencia_imprenta`, `competencia_copisteria`, `competencia_tienda_deporte`, `competencia_tienda_ropa`, `competencia_total` | Negocios de cada tipo registrados | OpenStreetMap |
| `trabajo_restaurante`, `trabajo_cafe`, `trabajo_hotel`, `trabajo_institucion_social`, `trabajo_total` | Posibles clientes de la oferta Trabajo registrados | OpenStreetMap |
| `graficas_grafica`, `graficas_estampagem`, `graficas_bordados`, `graficas_personalizacion`, `graficas_fardamento`, `graficas_publicidad`, `graficas_total` | Negocios encontrados por el nombre; vacío en los 9 municipios grandes que no respondieron a tiempo | OpenStreetMap |

### `data/clean/indice_municipios.csv` (66 filas)

| Columna | Descripción |
|---|---|
| `municipio`, `distrito`, `piloto` | Como en `municipios.csv` |
| `indice_a` | Índice de oportunidad de 0 a 100 con los cinco componentes al mismo peso: organizaciones, gasto público, jóvenes, competencia (al revés) y cercanía |
| `indice_b` | El mismo índice con más peso a la cercanía (35 %) y menos a los jóvenes (10 %); los pesos están en `config.yaml` |

Cada componente es el percentil del municipio (0 a 1) en esa variable. Los pesos son una decisión, no un dato: por eso hay dos y se comparan.

### `data/clean/guia_abordaje.csv` (una fila por segmento)

| Columna | Descripción |
|---|---|
| `segmento` | Tipo de organización |
| `organizaciones` | Organizaciones del segmento registradas en OpenStreetMap |
| `pct_con_email` | % de esas organizaciones con email público |
| `canal` | Por dónde contactar, según el contacto público que tienen |
| `oferta` | Oferta de la marca que encaja (Equipas, Eventos o Trabajo) |
| `idea` | Idea de prenda para el primer contacto (decisión de la marca, en `config.yaml`) |
| `cuando` | Momento del año para el contacto |

### Archivos internos (no se publican)

- `data/clean/leads_organizaciones.csv`: 1.596 organizaciones con nombre, segmento, municipio, freguesia (solo piloto), email, teléfono, web, coordenadas, distancia a la base, fuente, licencia y fecha de recogida.
- `data/clean/leads_airtable.csv`: la misma lista lista para importar en Airtable, con puntuación de 0 a 100 (segmento 35 %, contacto 25 %, municipio 25 %, cercanía 15 %), puesto dentro de su segmento, oferta sugerida, compras públicas de su cámara (solo cámaras), un hecho real para el primer contacto, una idea de prenda, próximo festivo, ventana de contacto (de 8 a 4 semanas antes) y las fechas de los tres contactos (el segundo 5 días hábiles después del primero y el tercero 7 días hábiles después del segundo).
- `data/clean/leads_empresas.csv`: negocios para la oferta Trabajo.
- `data/interno/contratos_ropa_region.csv` y `anuncios_ropa_region.csv`: contratos y anuncios de la región, con proveedores.

### Base de datos MySQL `beira`

| Tabla | Filas | Clave primaria | Relación |
|---|---|---|---|
| `municipios` | 66 | `municipio` | |
| `contratos` | 485 | `idcontrato` | `municipio` → `municipios.municipio` |
| `organizaciones` | 1.596 | `id` | `municipio` → `municipios.municipio` |
| `anuncios` | 110 | `IdIncm` | `municipio` → `municipios.municipio` |

## Ética y privacidad

- Solo se recogen datos de organizaciones, nunca de personas.
- Se respetan el robots.txt y las negativas de los servidores (no se buscan rodeos), con pausas entre peticiones y un user agent que identifica el proyecto.
- Los contactos, los proveedores y los datos de clientes quedan fuera de GitHub (`.gitignore`). Los notebooks solo muestran cifras.
- Las organizaciones con las que el autor tiene un conflicto de interés están en una lista interna de exclusiones y nunca entran en la lista de contactos.

## Límites

- Las compras de menos de 5.000 € (ajuste directo simplificado) no se publican en el BASE, y las juntas casi no aparecen: el gasto real de las juntas no se ve.
- El aumento de contratos de 2020 a 2025 puede deberse en parte a un mejor registro en el BASE.
- OpenStreetMap está incompleto: tiene 33 de las 78 juntas del piloto y 61 clubes en toda la región.
- Las empresas por municipio del INE son de 2022, un año antes que el resto.
- Solo 34 de 1.552 organizaciones tienen año de fundación en OpenStreetMap: los aniversarios no se pudieron usar como gancho.
- Las fechas de la secuencia de contactos cuentan días hábiles de lunes a viernes, sin descontar los festivos.
- «Merchandising» incluye artículos que no son ropa (el CPV de artículos promocionales es general).
- Google Trends es un índice relativo: dice cuándo se busca más, no cuánto.
- Los pesos del índice y de la lista de contactos son decisiones; con otros pesos cambia el orden.

## Próximos pasos

1. Verificar a mano la muestra de 20 contactos (10 colegios y 10 de otros segmentos) antes de importar la lista en Airtable.
2. Lanzar el piloto en los 6 municipios con la ventana de contacto de cada festivo y registrar respuestas y pedidos: son los datos propios que faltan sobre clubes y asociaciones.
3. Vigilar cada dos semanas los anuncios del BASE (el conjunto de datos se actualiza con esa frecuencia) para ver los concursos abiertos de la región.
4. Repetir la búsqueda de gráficas por nombre en los 9 municipios grandes que no respondieron a tiempo.

## Herramientas

Python (pandas, numpy, requests, BeautifulSoup, matplotlib), SQLite, MySQL Workbench, VS Code y Jupyter.
