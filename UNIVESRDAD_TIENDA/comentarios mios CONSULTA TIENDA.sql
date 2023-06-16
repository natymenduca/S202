SELECT nombre FROM producto; ## lista los nombres de los prod de la tabla producto
SELECT nombre, precio FROM producto;#lista los nombres de los prod y precios de la tabla producto
SHOW COLUMNS FROM producto;# lista todas las columnas de la tabla producto
SELECT nombre, precio AS euros, (precio * conversion_rate) AS dolares FROM producto;#lista el nom de los prod, precio en € y el precio en $USD
SELECT nombre AS "nombre producto", precio AS euros, precio * 1.09 AS dolar FROM producto;#lista el nom de los prod, el precio e y el precio en$USD, usa los alias para las columnas: nombre de prod, euros, dólares
SELECT UPPER(nombre), precio FROM producto;#lista todos los nom (conviertelos en mayusculas) y los precios de todos los prod de la tabla producto
SELECT LOWER(nombre), precio FROM producto;#lista todos los nom (conviertelos en minusculas) y los precios de todos los prod de la tabla producto
SELECT nombre, UPPER(SUBSTRING(nombre, 1, 2)) FROM fabricante;#lista el nom de todos los fabricantes en una columna y en otra columna dame en mayúsculas los dos primeras letras del nombre del fabricante.
SELECT nombre, ROUND(precio) FROM producto;#lista los nom y redondea el valor de los precios de todos los prod de la tabla producto
SELECT nombre, TRUNCATE(precio, 0) FROM producto;#lista los nom y el muestra valor sin ninguna cifra decimal de los precios de todos los prod de la tabla producto
SELECT codigo_fabricante FROM producto;#lista el codigo de los fabricantes la tabla producto
SELECT DISTINCT codigo_fabricante FROM producto; #lista el código de los fabricantes eliminando los códigos repetidos que tienen prod en la tabla prod
SELECT nombre FROM fabricante ORDER BY nombre ASC;#lista los nombres de los fabricantes ordenados de manera ascendente
SELECT nombre FROM fabricante ORDER BY nombre DESC;#lista los nombres de los fabricantes ordenados de manera descendente
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;#lista los nom de los prod ordenados, primero el nombre de manera ascendente,segundo el precio de manera descendente
SELECT * FROM fabricante LIMIT 5;# * Retorna una lista con las 5 primeras filas de la tabla fabricante
SELECT * FROM fabricante LIMIT 3, 2; #Retorna una lista con 2 filas a partir de la 4 fila de la mesa fabricante. La 4cuarta fila también se tiene que incluir en la respuesta
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1; # lista el nom y el precio del prod más barato, se usa ORDER BY y LIMIT (no podría usar MIN(precio), necesitaría GROUP BY)
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1; # # lista el nom y el precio del prod más caro, se usa ORDER BY y LIMIT (no podría usar MAX(precio), necesitaría GROUP BY)
SELECT producto.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.codigo = 2;#Lista el nom de todos los prod del fabricante cuyo código de fabricante es igual a 2
SELECT p.nombre AS'nombre producto',p.precio, f.nombre AS'nombre fabricante'FROM producto p JOIN fabricante f ON p. codigo_fabricante = f.codigo;# Retorna una lista con el nom del prod, precio y nom de fabricante de todos los prod de la base de datos
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;# Retorna una lista con el nom del prod, precio y nom de fabricante ordenados por orden alfabetico de todos los prod de la base de datos
SELECT p.codigo AS codigo_producto, p.nombre  AS nombre_producto, p.codigo_fabricante, f.nombre AS nombre_fabrica FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;#Retorna una lista con el codg del prod, nom del prod, codg del fabricante y nom del fabricante, de todos los prod de la base de datos
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo  WHERE p.precio = (SELECT MIN(precio) FROM producto);#Retorna el nom del prod, su precio y el nom de su fabricante, del prod más barato
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo  WHERE p.precio = (SELECT MAX(precio) FROM producto);#Retorna el nom del prod, su precio y el nombre de su fabricante, del prod más caro
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';#Retorna una lista de todos los prod del fabricante Lenovo
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;#Retorna una lista de todos los prod del fabricante Crucial que tengan un precio mayor que 200 €
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';#Retorna un listado con todos los prod de los fabric Asus, Hewlett-29Packardy Seagate. Sin usar IN
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');#Retorna un listado con todos los prod de los fabricantes Asus, Hewlett-Packardy Seagate. Usando el operador IN.
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '% e';#Retorna un listado con el nom y el precio de todos los prod de los fabricantes el nombre de los cuales acabe por la vocal e
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '% w %';#Retorna un listado con el nom y el precio de todos los prod el nom de fabricante de los cuales contenga el carácter w en su nombre
#Retorna un listado con el nom de prod, precio y nom de fabricante, de todos los prod que tengan un precio > o = a 180 €, y ordena el resultado, 1 por el precio (en orden descendente) y 2, por el nombre (en orden ascendente)
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;#arriba explicacion
SELECT f.codigo AS codigo_fabricante,f.nombre AS nombre_fabricante FROM fabricante f JOIN producto p ON f.codigo = p.codigo_fabricante GROUP BY f.codigo, f.nombre;#Retorna un listado con el codg y el nom de fabricante, solo de aquellos fabricantes que tienen prod asociados en la base de datos.
SELECT f.nombre AS nomre_fabricant, p.nombre AS nombre_producto FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;#Retorna un listado de todos los fabricantes que existen en la base de datos, junto con los prod que tiene cada uno de ellos,se tendrá que mostrar también los fabri que no tienen prod asoc
SELECT f.nombre AS nombre_fabricante FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo IS NULL;#Retorna un listado donde solo aparezcan los fabricantes que no tienen ningún prod asociado
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p, fabricante f WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'Lenovo';#Retorna todos los productos del fabricante Lenovov(Sin utilizar INNER JOIN)
SELECT * FROM producto WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));#Retorna todos los datos de los prod que tienen el mismo precio que el prod más caro del fabricante Lenovo. (Sin usar INNER JOIN)
SELECT nombre AS nombre_producto FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo') ORDER BY precio DESC LIMIT 1;#lista el nombre del producto más caro del fabricante Lenovo
SELECT nombre AS nombre_producto FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Hewlett-Packard') ORDER BY precio ASC LIMIT 1;#lista el nombre del prod más barato del fabricante Hewlett-Packard
SELECT * FROM producto WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));#Retorna todos los prod de la base de datos que tienen un precio mayor o igual al prod más caro del fabricante Lenovo.
#Lista todos los productos del fabricante Asus que tienen un precio superior al precio mediano de todos sus productos
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') AND precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus'));
































