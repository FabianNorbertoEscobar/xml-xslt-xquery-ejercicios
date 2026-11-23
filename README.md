# Prácticas de XML, XPath, XSLT y XQuery

Colección de ejercicios para aprender a modelar, validar, consultar y transformar datos XML. Los ejemplos trabajan con bibliotecas, catálogos de música, películas, equipos deportivos y otros conjuntos de datos. Es material de práctica: no es una aplicación integral ni todos los archivos representan soluciones terminadas.

## Tecnologías y conceptos

| Tecnología | Uso en el repositorio |
| --- | --- |
| **XML** | Documentos jerárquicos con elementos, atributos, datos anidados y referencias entre registros. |
| **DTD y XML Schema (XSD)** | Ejercicios de definición de estructura, cardinalidad, atributos, tipos y restricciones. |
| **XPath** | Navegación por rutas, selección de atributos, predicados y funciones sobre nodos. |
| **XSLT** | Transformación de XML a HTML o XML mediante plantillas, iteración, selección y condiciones. |
| **XQuery** | Consultas FLWOR, construcción de resultados XML, funciones de agregación y ejemplos de actualización de nodos. |
| **HTML y CSS** | Presentación de resultados transformados y estilos aplicados a documentos XML. |

El repositorio incluye **Saxon-HE 9.7** en la carpeta del curso, para ejecutar ejemplos de XSLT y XQuery con Java. También contiene archivos de proyecto de Eclipse; no hace falta importar esos proyectos para probar los comandos de abajo.

## Qué se practica

- **Modelado y validación:** `biblioteca.xml`, `curso.xml`, `familia_perez.xml` y `personas.xml` tienen declaraciones DTD y, en algunos casos, referencias a esquemas XSD. Los esquemas exploran secuencias, elementos opcionales o repetidos, tipos, patrones y relaciones mediante claves y referencias.
- **Consultas de catálogos:** `biblioteca.xq`, `cdcatalogo.xq` y `videoclub.xq` exploran filtros por título, autor, precio o año, ordenamientos, promedios y construcción de elementos de resultado.
- **Relaciones entre documentos:** `ejercicios.xq` utiliza equipos, jugadores y entrenadores para practicar búsquedas por códigos, conteos y consultas sobre fechas. `ejemplo_ap_solucion.xq` contiene variantes adicionales.
- **Funciones de XQuery:** `funciones.xq` reúne ejemplos de agregación, valores distintos, operaciones con secuencias y fechas. Otros ejercicios utilizan `starts-with`, `contains` y expresiones cuantificadas.
- **Transformaciones:** `cdcatalogo.xsl` genera una tabla HTML; los ejemplos de pedidos del curso muestran plantillas, funciones XPath y condiciones. Las tareas con `Student.xml` generan una tabla de calificaciones o seleccionan un estudiante por su identificador.
- **Actualizaciones:** los archivos `food_menu insert.xq`, `food_menu delete.xq` y `foof_menu replace.xq` ilustran inserción, eliminación y reemplazo de nodos sobre un menú. Son ejercicios de XQuery Update y requieren un procesador que implemente esa extensión.

## Organización

Los archivos relacionados están principalmente en la raíz y comparten el nombre del dominio cuando corresponde:

```text
.
├── biblioteca.{xml,dtd,xsd,xq,xsl}
├── cdcatalogo.{xml,xq,xsl}
├── videoclub.{xml,xq,xsl,xslt,txt}
├── curso.{xml,dtd,css}
├── familia_perez.xml, familia.{dtd,xsd}
├── personas.{xml,dtd,xsd}, libreria.xml
├── equipos.xml, jugadores1.xml, jugadores2.xml, entrenadores1.xml
├── ejercicios.xq, funciones.xq y otros ejemplos .xq
├── food_menu.xml y consultas de actualización
└── xslt xsl xpath xquery ejercicios curso ITR/
    ├── XPATH/      # pedidos, funciones XPath y salida HTML
    ├── XSLT/       # transformación de un pedido a HTML
    ├── XQuery/     # datos de libros, Saxon y material de configuración
    └── tasks/      # ejercicios con estudiantes, pedidos y pasajeros
```

También hay documentos XML independientes, como `alumnos.xml`, `empresa.xml`, `books.xml` y `plant_catalog.xml`, que sirven como datos para practicar.

## Cómo probar los ejemplos

Necesitás **Java** y una terminal. Ejecutá los comandos desde la raíz del repositorio; las comillas son necesarias porque la ruta al JAR contiene espacios.

### Consultar el catálogo con XQuery

```bash
java -cp "xslt xsl xpath xquery ejercicios curso ITR/XQuery/lib/saxon9he.jar" \
  net.sf.saxon.Query cdcatalogo.xq
```

La consulta produce en la terminal una secuencia con los resultados de varios ejercicios: títulos, artistas, empresas y precios. Podés abrir `cdcatalogo.xq` para ejecutar o modificar cada expresión por separado.

### Transformar el catálogo a HTML

```bash
java -cp "xslt xsl xpath xquery ejercicios curso ITR/XQuery/lib/saxon9he.jar" \
  net.sf.saxon.Transform -s:cdcatalogo.xml -xsl:cdcatalogo.xsl -o:catalogo.html
```

Abrí `catalogo.html` en un navegador para ver la tabla. El archivo se genera localmente; el comando lo sobrescribe si ya existe. `cdcatalogo.xml` también vincula la hoja mediante `xml-stylesheet`, aunque el soporte para mostrar transformaciones locales depende del navegador.

### Validar y experimentar

Para comprobar un documento contra una DTD o un XSD, usá un editor XML o un validador compatible y seleccioná explícitamente el archivo de esquema correspondiente. Un documento *bien formado* cumple la sintaxis XML; es *válido* cuando además cumple las reglas de la DTD o el esquema elegido. La validación no corrige automáticamente ni el documento ni el esquema.

Para practicar XPath, probá las rutas y predicados en un editor XML o revisá las expresiones usadas dentro de las hojas XSLT. Al ejecutar consultas con `doc()`, conservá las rutas relativas entre los archivos; otras usan un documento de contexto y necesitan que se lo proporciones en el procesador. XML distingue mayúsculas de minúsculas en nombres de elementos y atributos.

## Estado y consideraciones

- Los archivos son ejercicios independientes: algunos incluyen varios resultados en una misma consulta, variantes, enunciados o fragmentos incompletos. No hay un proceso único de compilación ni una suite de pruebas automatizadas.
- Algunos ejemplos necesitan correcciones antes de ejecutarse o validarse. Por ejemplo, `biblioteca.dtd` tiene una declaración mal formada que impide leer `biblioteca.xml` con procesadores que cargan esa DTD; `familia.xsd` y `personas.xsd` también contienen errores. Los archivos XSL del videoclub presentan caracteres o sintaxis problemáticos.
- `curso.xml` referencia `estilo.css`, mientras que el archivo disponible se llama `curso.css`; para probar ese estilo hay que ajustar la referencia o aplicarlo desde el editor.
- Las consultas de actualización pueden modificar datos: trabajá sobre una copia de `food_menu.xml` y consultá la documentación del procesador elegido sobre persistencia y contexto. El Saxon-HE incluido no debe asumirse compatible con XQuery Update.

## Referencias

- [XML](https://www.w3.org/XML/) y [XML Schema](https://www.w3.org/XML/Schema)
- [XPath](https://www.w3.org/TR/xpath/) y [XSLT](https://www.w3.org/TR/xslt/)
- [XQuery](https://www.w3.org/TR/xquery/) y [XQuery Update Facility](https://www.w3.org/TR/xquery-update-10/)
