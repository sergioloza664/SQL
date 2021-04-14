
	/*++++++++++++++++++++++++++++++++++++++CREAR OBJETOS+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|---------------|*/
	/*|CREATE DATABASE|*/
	/*|---------------|*/
	/* crea una base de datos*/
	CREATE DATABASE testDb
	;
	
	/*|---------------|*/
	/*|CREATE DATABASE|*/
	/*|---------------|*/
	/* creacion de una tabla*/
	CREATE TABLE nombre_tabla(
		id INTEGER UNSIGNED NOT NULL,
		firs_name VARCHAR(45) NOT NULL
		PRIMARY KEY (id)
	
	);
	
	/*|-------|*/
	/*|EJEMPLO|*/
	/*|-------|*/
	/* TIMESTAMP: devuelve un valor de fecha y hora, es un tipo de dato*/
	/* DEFAULT: por defecto*/
	/* CURRENT_TIMESTAMP: devuelve la fecha y hora actuales*/
	/* ON UPDATE; si se actualiza el campo hara algo en este caso sera CURRENT_TIMESTAMP*/
	/* INDEX: se utiliza para recuperar datos mas rapidamente, el usuario no puede ver elos index*/
	CREATE TABLE actor (
		actor_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
		first_name VARCHAR(45) NOT NULL,
		last_name VARCHAR(45) NOT NULL,
		last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		PRIMARY KEY (actor_id),
		INDEX idx_last_name (last_name)
	
	);
	
	
	
	
	
	/*++++++++++++++++++++++++++++++++++++++MODIFICAR OBJETOS++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|-----------|*/
	/*|ALTER TABLE|*/
	/*|-----------|*/
	/* añade el campo dateOfBirth a la tabla actor*/
	ALTER TABLE actor
	ADD dateOfBirth DATE
	;
	/* cambia el nombre del campo dateOfBirth por yearOfBirth de la tabla actor*/
	ALTER TABLE actor
	CHANGE dateOfBirth yearOfBirth DATE
	;
	/* cambia el tipo de dato de yearOfBirth de DATE a SMALLINT de la tabla actor*/
	ALTER TABLE actor
	MODIFY COLUMN yearOfBirth SMALLINT(4)
	;
	/* elimina el campo yearOfBirth de la tabla actor*/
	ALTER TABLE actor
	DROP yearOfBirth
	;
	
	
	
	
	
	/*++++++++++++++++++++++++++++++++++++++ELIMINAR OBJETOS++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|-------------|*/
	/*|DROP DATABASE|*/
	/*|-------------|*/
	/* elimina la base de datos testDB*/
	DROP DATABASE testDB
	;
	
	/*|----------|*/
	/*|DROP TABLE|*/
	/*|----------|*/
	/* elimina la tabla nombre_tabla*/
	DROP TABLE nombre_tabla
	;
	
	/*|--------------|*/
	/*|TRUNCATE TABLE|*/
	/*|--------------|*/
	//* elimina todod los datos de la tabla nombre_tabla*/
	TRUNCATE TABLE nombre_tabla
	;