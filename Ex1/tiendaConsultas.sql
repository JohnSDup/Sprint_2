SELECT `nombre` FROM `producto`;
SELECT `producto`.`nombre`, `producto`.`precio` FROM `producto`;
SHOW COLUMNS FROM `producto`;
SELECT nombre , precio as euros , ROUND(precio * 1.08, 2) AS dolares FROM `producto` 
SELECT nombre as producto , precio as euros , ROUND(precio * 1.08, 2) AS dolares_norte_americanos FROM `producto` 
SELECT UPPER(nombre), precio  FROM `producto`;
SELECT LOWER(nombre), precio  FROM `producto`;
SELECT nombre,UPPER(LEFT(nombre,2)) FROM `producto`;
SELECT nombre,ROUND(precio) FROM `producto`;
SELECT nombre,TRUNCATE(precio,0) FROM `producto`;
SELECT  `codigo_fabricante` FROM `producto`;
SELECT DISTINCT  `codigo_fabricante` FROM `producto`;
SELECT `nombre` FROM `fabricante` ORDER BY nombre ASC;
SELECT `nombre` FROM `fabricante` ORDER BY nombre DESC;
SELECT `nombre`,`precio` FROM `producto` ORDER BY nombre ASC, precio DESC;
SELECT * FROM `fabricante` LIMIT 5;
SELECT `nombre`,`codigo` FROM `fabricante`WHERE codigo IN (4,5);
SELECT `nombre`,`precio` FROM `producto` ORDER BY precio LIMIT 1; (SOLICITUD 18 Comprobar si esta bien)
SELECT `nombre`,`precio` FROM `producto` GROUP BY precio DESC LIMIT 1;
SELECT `nombre` FROM `producto` WHERE codigo_fabricante = 2;
SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante  FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY nombre_fabricante ASC;
SELECT producto.nombre AS nombre_producto,producto.codigo,  producto.precio,codigo_fabricante, fabricante.nombre AS nombre_fabricante  FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;
SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante  FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio ASC LIMIT 1;
SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante  FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;
SELECT producto.nombre FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'lenovo';
SELECT producto.nombre FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'crucial';
SELECT producto.nombre FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'ASUS' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';
SELECT producto.nombre FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre IN ('ASUS', 'Hewlett-Packard','Seagate');
SELECT producto.nombre AS nombre_producto, producto.precio  FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.nombre LIKE '%e';
SELECT producto.nombre AS nombre_producto, producto.precio  FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.nombre LIKE '%w%';
SELECT producto.nombre AS nombre_producto, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto INNER JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180  ORDER BY producto.precio DESC, producto.nombre ASC;
SELECT DISTINCT fabricante.codigo, fabricante.nombre AS nombre_fabricante FROM fabricante JOIN producto ON fabricante.codigo = producto.codigo_fabricante;
SELECT fabricante.nombre, producto.nombre  FROM fabricante LEFT JOIN producto ON codigo_fabricante = fabricante.codigo ;
SELECT fabricante.nombre, fabricante.codigo FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo_fabricante IS NULL;
SELECT `nombre` FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'lenovo');
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto  WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'lenovo'));
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'lenovo' ORDER BY precio DESC LIMIT 1;
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Hewlett-Packard' ORDER BY precio ASC LIMIT 1;
(ESTA MAL) SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON fabricante.codigo = producto.codigo_fabricante WHERE fabricante.nombre = 'Lenovo' AND producto.precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = fabricante.codigo);


