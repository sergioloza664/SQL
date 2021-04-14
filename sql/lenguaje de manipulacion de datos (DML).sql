
	/*++++++++++++++++++++++++++++++++++++++CONSULTA BÁSICA++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|------|*/
	/*|SELECT|*/
	/*|------|*/
	/* muestra todas las columnas de actores*/	
	SELECT*
	FROM actor
	;		
	/* muestra las columnas last_name y first_name de la tabla actor*/
	SELECT last_name, first_name
	FROM actor
	;
	
	
	
	
	
	/*+++++++++++++++++++++++++++++++++++++MODIFICADORES+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|--------|*/
	/*|DISTINCT|*/
	/*|--------|*/
	/* muestra la columna last_name y first_name sin elementos repetidos*/
	SELECT DISTINCT last_name, first_name
	FROM actor
	;
	
	/*|--|*/	
	/*|AS|*/
	/*|--|*/
	/* muestra el resultado con el nombre que queremos que tengan las columnas en el resultado*/
	SELECT title AS 'FILM NAME', description AS 'SINOPSIS'
	FROM film
	;
	
	
	
	
	
	/*++++++++++++++++++++++++++++++++++++++OPERADORES MATEMATICOS++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|----------------------|*/
	/*|OPERADORES MATEMATICOS|*/
	/*|----------------------|*/
	/* muestra todas las peliculas con el precio multiplicado por 0.75*/	
	SELECT TITLE AS 'Titulo', rental_rate * 0.75 AS 'Precio euros'
	FROM film
	;	
	
	
	
	
	
	/*+++++++++++++++++++++++++++++++++++RESTRICCIÓN Y ORDENACIÓN++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|-----|*/
	/*|WHERE|*/
	/*|-----|*/
	/* muestra los actores cuyo last_name sea ALLEN*/
	SELECT last_name, first_name
	FROM actor
	WHERE last_name = 'ALLEN'
	;
		
	/*|------------------------|*/
	/*|OPERANDOS DE COMPARACION|*/
	/*|------------------------|*/
	/* muestra las peliculas cuya length sea mayor o igual a 120*/
	SELECT *
	FROM film
	WHERE length >= 120
	;	
	/* muestra las peliculas cuya length sea diferente de 120*/
	SELECT *
	FROM film
	WHERE length <> 120
	;
	
	/*|-------------------|*/	
	/*|ORDER BY + ASC/DESC|*/
	/*|-------------------|*/
	/* muestra las peliculas ordenadas descendentemente, por defecto se ordena ascendentemente*/
	SELECT *
	FROM film
	ORDER BY title DESC
	;
	
	/*|----------------|*/	
	/*|WHERE + ORDER BY|*/
	/*|----------------|*/
	/* muestra los actores cuyo last_name sea ALLEN y los ordena descendentemente*/
	SELECT last_name, first_name
	FROM actor
	WHERE last_name = 'ALLEN'
	ORDER BY first_name DESC
	;
	
	
	
	
	
	/*+++++++++++++++++++++++++++++++++++++OPERADORES LÓGICOS++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|------|*/
	/*|AND/OR|*/
	/*|------|*/
	/*muestra las peliculas donde length sea mayor que 90 y rental_rate sea menor o igual a 3*/
	SELECT title, rental_rate
	FROM film
	WHERE length < 90 AND rental_rate <= 3
	;
	/*muestra los consumidores cuyo first_name sea JHON o last_name sea SMITH active sea igual a 1*/
	SELECT *
	FROM customer
	WHERE (first_name = 'JOHN' OR last_name = 'SMITH')
	AND active = 1
	;
	
	/*|---|*/
	/*|NOT|*/
	/*|---|*/
	/* muestra los actores cuyo last_name no sea igual a ALLEN*/
	SELECT last_name, first_name
	FROM actor
	WHERE NOT last_name = 'ALLEN'
	;
	/* igual que con not*/
	SELECT last_name, first_name
	FROM actor
	WHERE last_name <> 'ALLEN'
	;
	
	/*|------------------|*/
	/*|LIKE + wildcards %|*/
	/*|------------------|*/
	/* muestra las peliculas cuyo titulo contenga LOVE, % significa cualquier cosa*/
	SELECT * 
	FROM film
	WHERE title LIKE %LOVE%
	;
	
	/*|--|*/
	/*|IN|*/
	/*|--|*/
	/* muestra los actores cuyo last_name sea igual a alguno de estos 3, IN no es compatible con LIKE*/
	SELECT *
	FROM actor
	WHERE last_name IN
	('ALLEN','MCCONAUGHEY','PALTROW')
	;
	/* igual que con IN*/
	SELECT *
	FROM actor
	WHERE last_name = 'ALLEN'
	OR last_name = 'MCCONAUGHEY'
	OR last_name = 'PALTROW'
	;
	
	/*|-------|*/
	/*|BETWEEN|*/
	/*|-------|*/
	/* muestra las peliculas cuyo rental_rate este entre 0.5 y 2.5*/
	SELECT *
	FROM film
	WHERE rental_rate BETWEEN 0.5 AND 2.5
	;
	/* igual que BETWEEN*/
	SELECT *
	FROM film
	WHERE rental_rate >= 0.5 AND rental_rate <= 2.5
	;
	
	/*|-------|*/
	/*|EJEMPLO|*/
	/*|-------|*/
	/* muestra las peliculas cuyo lengtheste entre 90 y 120 y que ademas el rental_rate sea menor que 3 o el replacement_cost
	   sea menor a 15, todo esto ordenado por price descendente y title ascendentemente*/
	SELECT title AS 'film name', rental_rate AS 'price'
	FROM film
	WHERE (length BETWEEN 90 AND 120)
	AND (rental_rate <= 3 OR replacement_cost < 15)
	ORDER BY price DESC, title
	;
	
	
	
	
	
	/*+++++++++++++++++++++++++++++++++++++CONSULTAS DE UNION++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|-----|*/
	/*|UNION|*/
	/*|-----|*/
	/* muestra los datos unidos de dos tablas, tiene que haber el mismo numero de columnas en el select con el mismo tipo 
	   de datos, si hay datos iguales en una y otra tabla no se mostraran datos repetidos*/
	SELECT last_name AS 'Apellido', first_name AS 'Nombre'
	FROM customer
	UNION
	SELECT last_name, first_name
	FROM actor
	;
	
	/*|---------|*/
	/*|UNION ALL|*/
	/*|---------|*/
	/* muestra los datos unidos de dos tablas, tiene que haber el mismo numero de columnas en el select con el mismo tipo 
	   de datos, se muestran todos los datos de las tablas aunque esten repetidos, esta ordenado por Apellido que es
	   el  nuevo nombre de la columna last_name*/
	SELECT last_name AS 'Apellido'
	FROM customer
	UNION ALL
	SELECT last_name
	FROM actor
	ORDER BY Apellido
	;
	
	
	
	
	
	/*+++++++++++++++++++++++++++++++++++++SUBCONSULTAS++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|------------------|*/
	/*|SUBCONSULTA CON IN|*/
	/*|------------------|*/
	/* muestra los empleados cuya oficina este en USA*/
	SELECT last_name, first_name
	FROM employees
	WHERE officeCode IN (SELECT officeCode
						FROM offices
						WHERE country = 'USA')
	;
	
	/*|----------------------|*/
	/*|SUBCONSULTA CON NOT IN|*/
	/*|----------------------|*/
	/* muestra los empleados cuya oficina no este en USA*/
	SELECT last_name, first_name
	FROM employees
	WHERE officeCode NOT IN (SELECT officeCode
						FROM offices
						WHERE country = 'USA')
	;
	
	/*|----------------------|*/
	/*|SUBCONSULTA CON EXISTS|*/
	/*|----------------------|*/
	/* muestra el número de empleados cuya oficina este en USA, EXISTS tiene en cuenta los valores NULL mientras que IN no*/
	SELECT COUNT(*)
	FROM employees
	WHERE officeCode EXISTS (SELECT officeCode
							FROM offices
							WHERE country = 'USA')
	;
	
	/*|--------------------------|*/
	/*|SUBCONSULTA CON NOT EXISTS|*/
	/*|--------------------------|*/
	/* muestra el número de empleados cuya oficina no este en USA, EXISTS tiene en cuenta los valores NULL mientras que IN no*/
	SELECT COUNT(*)
	FROM employees
	WHERE officeCode NOT EXISTS (SELECT officeCode
								FROM offices
								WHERE country = 'USA')
	;
	
	
	
	
	
	/*+++++++++++++++++++++++++++++++++++++CONSULTAS CON FUNCIONES ESCALARES++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|-----|*/
	/*|LCASE|*/
	/*|-----|*/
	/* muestra las peliculas en minusculas*/
	SELECT LCASE(title)
	FROM film
	;
	
	/*|------|*/
	/*|CONCAT|*/
	/*|------|*/
	/* muestra el last_name y el first_name concatenado en una sola tabla*/
	SELECT CONCAT(last_name,', ',first_name)
	FROM actor
	;
	/* muestra el last_name y el first_name concatenado en una sola tabla con first_name en minusculas*/
	SELECT CONCAT(last_name,', ',LCASE(first_name))
	FROM actor
	;
	
	
	
	
	
	/*+++++++++++++++++++++++++++++++++++FUNCIONES DE AGREGADO++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|-----|*/
	/*|COUNT|*/
	/*|-----|*/
	/* muestra el numero de customer donde active sea igual a 1*/
	SELECT COUNT(*) AS 'Num Clientes'
	FROM customer
	WHERE active = 1
	;
	
	/*|---|*/
	/*|MAX|*/
	/*|---|*/
	/* nos muestra la pelicula con el rental_rate mas alto*/
	SELECT MAX(rental_rate) AS 'Precio máximo', MIN(rental_rate) AS 'Precio minimo'
	FROM film
	;
	
	/*|---|*/
	/*|MIN|*/
	/*|---|*/
	/* nos muestra el rental_rate mas bajo*/
	SELECT MIN(rental_rate) AS 'Precio minimo'
	FROM film
	;
	
	/*|---|*/
	/*|SUM|*/
	/*|---|*/
	/* nos muestra la suma de los precios de todas las peliculas*/
	SELECT SUM(rental_rate) AS 'Suma Total'
	FROM film
	;
	
	/*|---|*/
	/*|AVG|*/
	/*|---|*/
	/* nos muestra lel rental_rate medio de todas las peliculas*/
	SELECT MIN(rental_rate) AS 'Precio minimo'
	FROM film
	;
	
	
	
	
	
	/*+++++++++++++++++++++++++++++++++++CONSULTAS DE AGRUPACIÓN+++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|--------|*/
	/*|GROUP BY|*/
	/*|--------|*/
	/* muestra el número de peliculas agrupadas por rental_rate*/
	SELECT COUNT(film_id), rental_rate
	FROM film
	GROUP BY rental_rate
	;
	/* muestra el número de peliculas agrupadas por rental_rate donde replacement_cost sea menor o igual a 20 
	   ordenados descendentemente por rental_rate*/
	SELECT COUNT(film_id), rental_rate
	FROM film
	WHERE replacement_cost <= 20
	GROUP BY rental_rate
	ORDER BY rental_rate DESC
	;
	
	/*|--------------|*/
	/*|GROUP BY/COUNT|*/
	/*|--------------|*/
	/* muestra el número de peliculas agrupadas por rental_rate donde replacement_cost sea menor o igual a 20, 
	   donde cada grupo tenga 165 o mas peliculas, ordenados descendentemente por rental_rate, 
	   HAVING admite funciones WHERE no*/
	SELECT COUNT(film_id), rental_rate
	FROM film
	WHERE replacement_cost <= 20
	GROUP BY rental_rate
	HAVING COUNT(film_id) >= 165
	ORDER BY rental_rate DESC
	;
	
	
	
	
	
	/*+++++++++++++++++++++++++++++++++++CONSULTAS SOBRE MÁS DE UNA TABLA+++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|--------------|*/
	/*|WHERE sin JOIN|*/
	/*|--------------|*/
	/* muestra el first_name el last_name y el address de las tablas customer y address cuyo campo address_id de ambas 
	   tablas coincida, customer c es igual a customer AS c*/
	SELECT first_name, last_name, ADDRESS
	FROM customer c, address a 
	WHERE c.address_id = a.address_id
	;
	
	/*|----------|*/
	/*|INNER JOIN|*/
	/*|----------|*/
	/* muestra el first_name el last_name y el address de las tablas customer y address cuyo campo address_id de ambas 
	   tablas coincida, donde active sea igual a 1*/
	SELECT first_name, last_name, address
	FROM customer c INNER JOIN address a
	ON c.address_id = a.address_id
	WHERE active = 1;
	
	/*|----------|*/
	/*|LEFT JOIN|*/
	/*|----------|*/
	/* muestra el first_name el last_name y el address de las tablas customer y address cuyo campo address_id de ambas 
	   tablas coincida, donde active sea igual a 1, muestra todos los customer aunque no tengan address*/
	SELECT first_name, last_name, address
	FROM customer c LEFT JOIN address a
	ON c.address_id = a.address_id
	WHERE active = 1;
	
	/*|----------|*/
	/*|RIGHT JOIN|*/
	/*|----------|*/
	/* muestra el first_name el last_name y el address de las tablas customer y address cuyo campo address_id de ambas 
	   tablas coincida, donde active sea igual a 1, muestra todos los address aunque no tengan custommer*/
	SELECT first_name, last_name, address
	FROM customer c RIGHT JOIN address a
	ON c.address_id = a.address_id
	WHERE active = 1;
	
	/*|---------------|*/
	/*|FULL OUTER JOIN|*/
	/*|---------------|*/
	/* muestra el first_name el last_name y el address de las tablas customer y address cuyo campo address_id de ambas 
	   tablas coincida, donde active sea igual a 1, muestra todos los datos aunque no tengan customer o address,
	   es como LEFT JOIN y RIGHT JOIN juntos*/
	SELECT first_name, last_name, address
	FROM customer c FULL OUTER JOIN address a
	ON c.address_id = a.address_id
	WHERE active = 1;
	
	
	
	
	
	/*+++++++++++++++++++++++++++++++++++++++++CONSULTAS DE INSERCIÓN++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|------------------|*/
	/*|INSERT INTO/VALUES|*/
	/*|------------------|*/
	/* inserta los datos en las columnas especificadas*/
	INSERT INTO actor (last_name, first_name)
	VALUES ('GARCIA','MANOLO')
	;
	/* inserta los datos en todas las columnas de la tabla, tenemos que poner los datos de cada columna o pener null*/
	INSERT INTO actor
	VALUES (210, 'MANOLO','GARCIA','2020-04-04 00:22:34')
	;
	
	
	
	
	
	/*+++++++++++++++++++++++++++++++++++++++++CONSULTAS DE ACTUALIZACIÓN+++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|----------|*/
	/*|UPDATE/SET|*/
	/*|----------|*/
	/* actualiza first_name y last_name de la tabla actor donde last_name es igual a GARCIA*/
	UPDATE actor
	SET first_name = 'MANUELA', last_name = 'LOPEZ'
	WHERE last_name = 'GARCIA'
	;
	
	
	
	
	
	/*+++++++++++++++++++++++++++++++++++++++++CONSULTAS DE ELIMINACIÓN+++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|------|*/
	/*|DELETE|*/
	/*|------|*/
	/* borra la fila de la tabla actor donde actor_id sea igual a 200*/
	DELETE
	FROM actor
	WHERE actor_id = 200
	;
	

	