# Base-De-Datos-Yeison-Vargas


**PROMPT**

Actúa como un experto en modelado de bases de datos. Tengo el siguiente caso de estudio:

*CASO DE ESTUDIO*
 
Negocio: "TechZone" – Centro de Servicios Tecnológicos y Cyber Gaming.

TechZone es un negocio ubicado en Cúcuta que combina tres líneas de servicio:

Reparación y mantenimiento: arreglo de celulares y PC's, instalación de software (sistemas operativos, licencias, drivers), mantenimiento preventivo/correctivo de electrónicos.
Cyber café: estaciones de computador con acceso a internet por tiempo, impresión de documentos, escaneo, etc.
Zona gaming: puestos con Xbox y PlayStation 5 para alquiler por tiempo/sesión, con catálogo de juegos disponibles.

El negocio necesita registrar clientes, empleados que atienden, órdenes de servicio técnico (con su diagnóstico, repuestos usados y estado), el inventario de repuestos y proveedores, las estaciones del cyber (equipos e internet), las consolas y sus sesiones de alquiler, y los pagos/facturas generados por cualquiera de los tres servicios.

Y esta es la estructura de entidades, atributos y relaciones que ya definí:

*ESTRUCTURA DEL MODELO ENTIDAD-RELACIÓN* 

Entidades y atributos principales:

Cliente: id_cliente, nombre, telefono, correo, documento
Empleado: id_empleado, nombre, cargo, telefono, fecha_ingreso
OrdenServicio: id_orden, id_cliente, id_empleado, tipo_equipo, marca_modelo, falla_reportada, diagnostico, estado, fecha_ingreso, fecha_entrega
Repuesto: id_repuesto, nombre, descripcion, stock, precio_unitario, id_proveedor
Proveedor: id_proveedor, nombre, telefono, correo
OrdenRepuesto (tabla intermedia): id_orden, id_repuesto, cantidad
EstacionCyber: id_estacion, nombre_pc, estado, tarifa_hora
SesionInternet: id_sesion, id_estacion, id_cliente, hora_inicio, hora_fin, valor_total
Consola: id_consola, tipo (Xbox/PS5), estado, tarifa_hora
SesionGaming: id_sesion_gaming, id_consola, id_cliente, juego, hora_inicio, hora_fin, valor_total
Factura: id_factura, id_cliente, id_empleado, fecha, valor_total, tipo_servicio (repuesto/cyber/gaming)

Relaciones principales:

Cliente (1) — (N) OrdenServicio
Empleado (1) — (N) OrdenServicio
OrdenServicio (N) — (M) Repuesto, a través de OrdenRepuesto
Repuesto (N) — (1) Proveedor
Cliente (1) — (N) SesionInternet
EstacionCyber (1) — (N) SesionInternet
Cliente (1) — (N) SesionGaming
Consola (1) — (N) SesionGaming
Cliente (1) — (N) Factura
Empleado (1) — (N) Factura
Factura (1) — (1) OrdenServicio / SesionInternet / SesionGaming (según el tipo de servicio facturado)

Necesito que:
1. Valides si el modelo entidad-relación está completo y coherente con el caso de estudio (revisa cardinalidades, claves primarias, claves foráneas y entidades débiles/intermedias).
2. Sugieras correcciones o mejoras si detectas errores de normalización o relaciones faltantes.
3. Generes el código XML compatible con draw.io (mxGraphModel) para poder importar directamente el diagrama ER en draw.io, incluyendo entidades, atributos y las relaciones con su cardinalidad correctamente etiquetada.

No agregues entidades ni funcionalidades que no estén en el caso de estudio que te di.
