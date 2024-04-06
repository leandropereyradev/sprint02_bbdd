USE tienda;

-- 1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT p.nombre FROM producto p;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT p.nombre, p.precio FROM producto p;

-- 3. Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

-- 4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT p.nombre, p.precio, ROUND(p.precio * 1.08, 2) FROM producto p;

-- 5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
-- Utiliza los siguientes sobrenombre para las columnas: nombre de producto, euros, dólares.
SELECT p.nombre AS nombre_producto, p.precio AS euros, ROUND(p.precio * 1.8, 2) AS dólares FROM producto p;

-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT UPPER(p.nombre), p.precio FROM producto p;

-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT LOWER(p.nombre), p.precio FROM producto p;

-- 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT DISTINCT f.nombre, UPPER(LEFT(f.nombre, 2)) AS dos_primeros_caracteres  FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo;

-- 9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT p.nombre, ROUND(p.precio, 0) AS precio_redondeado FROM producto p;

-- 10. Lista los nombres y precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT p.nombre, TRUNCATE(p.precio, 0) AS precio_sin_decimal FROM producto p;

-- 11. Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT p.codigo_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT p.codigo_fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT f.nombre FROM fabricante f ORDER BY f.nombre ASC;

-- 14. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT f.nombre FROM fabricante f ORDER BY f.nombre DESC;

-- 15. Lista los nombres de los productos ordenados, en primer lugar, por el nombre de forma ascendente y, en segundo lugar, por el precio de forma descendente.
SELECT p.nombre, p.precio FROM producto p ORDER BY p.nombre ASC, p.precio DESC;

-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT * FROM fabricante LIMIT 5;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también debe incluirse en la respuesta.
SELECT * FROM fabricante LIMIT 2 OFFSET 3;

-- 18. Lista el nombre y precio del producto más barato. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA: Aquí no podría usar MIN(precio), necesitaría GROUP BY.
SELECT p.nombre, p.precio FROM producto p ORDER BY p.precio ASC LIMIT 1;

-- 19. Lista el nombre y precio del producto más caro. (Utiliza solo las cláusulas ORDER BY y LIMIT). NOTA : Aquí no podría usar MAX(precio), necesitaría GROUP BY.
SELECT p.nombre, p.precio FROM producto p ORDER BY p.precio DESC LIMIT 1;

-- 20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT p.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.codigo = 2;

-- 21. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 22. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordena el resultado por el nombre del fabricante, por orden alfabético.
SELECT p.nombre, p.precio, f.nombre AS fabricante FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;

-- 23. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT p.codigo AS cod_producto, p.nombre, f.codigo AS cod_fabricante, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo;

-- 24. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT p.nombre AS nombre_prod, p.precio, f.nombre AS nombre_fabr FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;

-- 25. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT p.nombre AS nombre_prod, p.precio, f.nombre AS nombre_fabr FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;

-- 26. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';

-- 27. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;

-- 28. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT p.nombre AS nombre_prod, f.nombre AS nombre_fabr FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' UNION SELECT p.nombre, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' UNION SELECT p.nombre, f.nombre FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Seagate';

-- 29. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT p.nombre AS nombre_prod, f.nombre AS nombre_fabr FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre acabe por la vocal e.
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE  RIGHT(f.nombre, 1) = 'e';

-- 31. Devuelve un listado con el nombre y precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT p.nombre, p.precio FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';

-- 32. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordena el resultado, en primer lugar,
-- por el precio (en orden descendente) y, en segundo lugar, por el nombre (en orden ascendente).
SELECT p.nombre AS nombre_prod, p.precio, f.nombre AS nombre_fabr FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;

-- 33. Devuelve un listado con el código y el nombre de fabricante, sólo de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT f.codigo, f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;

-- 34. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también a aquellos
-- fabricantes que no tienen productos asociados.
SELECT f.codigo, f.nombre AS nombre_fabr, GROUP_CONCAT(p.nombre SEPARATOR ', ') AS productos FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante GROUP BY f.codigo, f.nombre;

-- 35. Devuelve un listado en el que sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT f.nombre FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo IS NULL;

-- 36. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';

-- 37. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin usar INNER JOIN).
SELECT * FROM producto p WHERE p.precio = ( SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = ( SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo' ));

-- 38. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre FROM producto p WHERE p.precio = (SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo'));

-- 39. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT p.nombre FROM producto p WHERE p.precio = (SELECT MIN(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Hewlett-Packard'));

-- 40. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * FROM producto p WHERE p.precio >= (SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo'));

-- 41. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
SELECT * FROM producto p JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' AND p.precio > (SELECT AVG(p.precio) FROM producto p WHERE p.codigo_fabricante = f.codigo);


USE universidad;
-- 1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos/as. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido,
--    segundo apellido y nombre.
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p WHERE p.tipo = 'alumno' ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 2. Halla el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT * FROM persona p WHERE p.tipo = 'alumno' AND p.telefono IS NULL;

-- 3. Devuelve el listado de los alumnos que nacieron en 1999.
SELECT * FROM persona p WHERE p.tipo = 'alumno' AND p.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

-- 4. Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF termina en K.
SELECT * FROM persona p WHERE p.tipo = 'profesor' AND p.telefono IS NULL AND RIGHT(p.nif, 1) = 'K';

-- 5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT * FROM asignatura a WHERE a.cuatrimestre = 1 AND a.curso = 3 AND a.id_grado = 7;

-- 6. Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido,
--    nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por apellidos y nombre.
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM profesor pr JOIN persona p ON pr.id_profesor = p.id JOIN departamento d ON pr.id_departamento = d.id ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 7. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM alumno_se_matricula_asignatura am JOIN asignatura a ON am.id_asignatura = a.id JOIN curso_escolar ce ON am.id_curso_escolar = ce.id JOIN persona p ON am.id_alumno = p.id WHERE p.tipo = 'alumno' AND p.nif = '26902806M';

-- 8. Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
SELECT d.nombre FROM departamento d JOIN profesor pr ON d.id = pr.id_departamento JOIN asignatura a ON pr.id_profesor = a.id_profesor JOIN grado g ON a.id_grado = g.id WHERE g.nombre = 'Ingeniería Informática (Plan 2015)';

-- 9. Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM persona p JOIN alumno_se_matricula_asignatura am ON p.id = am.id_alumno JOIN curso_escolar ce ON am.id_curso_escolar = ce.id WHERE ce.anyo_inicio = '2018' AND ce.anyo_fin = '2019';

-- Resuelve las 6 siguientes consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
-- 1. Devuelve un listado con los nombres de todos los profesores/as y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores/as que
--    no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor/a.
--    El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y nombre.
SELECT d.nombre AS nombre_departamento, p.apellido1 AS primer_apellido, p.apellido2 AS segundo_apellido, p.nombre AS nombre_profesor FROM profesor pr LEFT JOIN departamento d ON pr.id_departamento = d.id LEFT JOIN persona p ON pr.id_profesor = p.id ORDER BY nombre_departamento ASC, primer_apellido ASC, segundo_apellido ASC, nombre_profesor ASC;

-- 2. Devuelve un listado con los profesores/as que no están asociados a un departamento.
SELECT p.id, p.apellido1 AS 'Apellido 1', p.apellido2 AS 'Apellido 2', p.nombre AS 'Nombre' FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' AND pr.id_departamento IS NULL ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 3. Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL ORDER BY d.nombre ASC;

-- 4. Devuelve un listado con los profesores/as que no imparten ninguna asignatura.
SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM profesor pr LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor LEFT JOIN persona p ON pr.id_profesor = p.id WHERE a.id IS NULL ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 5. Devuelve un listado con las asignaturas que no tienen un profesor/a asignado.
SELECT a.nombre AS 'Asignatura' FROM asignatura a LEFT JOIN profesor pr ON pr.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL ORDER BY a.nombre ASC;

-- 6. Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT d.nombre AS 'Departamento' FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE a.curso IS NULL;

-- Consultas resumen:
-- 1. Devuelve el número total de alumnos existentes.
SELECT COUNT(*) AS 'Alumnos Existentes' FROM persona p WHERE p.tipo = 'alumno';

-- 2. Calcula cuántos alumnos nacieron en 1999.
SELECT COUNT(*) AS 'Nacidos en 1999' FROM persona p WHERE p.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

-- 3. Calcula cuántos profesores/as hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de
--    profesores/as que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores/as asociados y tendrá que estar ordenado de mayor
--    a menor por el número de profesores/as.
SELECT d.nombre AS 'Departamento', COUNT(pr.id_profesor)  AS cantidad_profesores FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id WHERE pr.id_departamento IS NOT NULL GROUP BY d.nombre ORDER BY cantidad_profesores DESC;

-- 4.Devuelve un listado con todos los departamentos y el número de profesores/as que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no
--   tienen profesores asociados. Estos departamentos también deben aparecer en el listado.
SELECT d.nombre AS 'Departamento', COUNT(pr.id_profesor)  AS cantidad_profesores FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id GROUP BY d.nombre ORDER BY cantidad_profesores DESC;

-- 5. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Ten en cuenta que pueden existir
--    grados que carecen de asignaturas asociadas. Estos grados también deben aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT g.nombre, COUNT(a.id) cantidad_asignaturas FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre ORDER BY cantidad_asignaturas DESC;

-- 6. Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT g.nombre, COUNT(a.id) cantidad_asignaturas FROM grado g JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre HAVING COUNT(a.id) > 40;

-- 7. Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos existentes para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del
--    grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que existen de este tipo.
SELECT g.nombre AS grado, a.tipo AS tipo_asignatura, SUM(a.creditos) AS credito FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id WHERE a.tipo IS NOT NULL GROUP BY g.nombre, a.tipo;

-- 8. Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado tendrá que mostrar dos columnas, una columna con
--    el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT ce.anyo_inicio, COUNT(DISTINCT am.id_alumno) AS num_alumnos_matriculados FROM curso_escolar ce LEFT JOIN alumno_se_matricula_asignatura am ON ce.id = am.id_curso_escolar GROUP BY anyo_inicio;

-- 9. Devuelve un listado con el número de asignaturas que imparte cada profesor/a. El listado debe tener en cuenta a aquellos profesores/as que no imparten ninguna asignatura. El resultado
--    mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT pr.id_profesor, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS asignaturas FROM profesor pr LEFT JOIN persona p ON p.id = pr.id_profesor LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor GROUP BY pr.id_profesor ORDER BY asignaturas DESC;

-- 10. Devuelve todos los datos del alumno/a más joven.
SELECT * FROM persona p WHERE p.tipo = 'alumno' ORDER BY p.fecha_nacimiento ASC LIMIT 1;

-- 11. Devuelve un listado con los profesores/as que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT CONCAT(p.apellido1, ' ', p.apellido2, ', ', p.nombre) AS nombre_completo FROM profesor pr JOIN persona p ON pr.id_profesor = p.id LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE pr.id_departamento IS NOT NULL AND a.id IS NULL;