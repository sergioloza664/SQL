
	/*++++++++++++++++++++++++++++++++++++++TIPOS DE DATOS BÁSICOS++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|---------|*/
	/*|NUMERICOS|*/
	/*|---------|*/
	/* INT, INTEGER, DECIMAL, ...*/
	INT 
	INTEGER(1)
	DECIMAL(5.2)
	
	/*|-------|*/
	/*|STRINGS|*/
	/*|-------|*/
	/* CHAR, VARCHAR, TEXT, ...*/
	CHAR(3)
	VARCHAR(5)
	TEXT(100)
	
	/*|---------|*/
	/*|DATE/TIME|*/
	/*|---------|*/
	/* DATE, TIME, DATETIME*/
	DATE
	TIME
	DATETIME
	
	/* más tipos de datos en: https://mariadb.com/kb/en/data-types/  */
	
	
	
	
	
	/*++++++++++++++++++++++++++++++++++++++RESTRICCIONES++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/*|-----------|*/
	/*|CONSTRAINTS|*/
	/*|-----------|*/
	NOT NULL /* obliga a rellenar el campo*/*/
	UNIQUE /* asegura que todos los valores son diferentes*/
	PRIMARY KEY /* clave principal. Una combinación de NOT NULL + UNIQUE. Identifica cada fila en una tabla*/
	FOREIGN KEY /* clave forénea. Se relaciona con el registro de otra tabla*/
	CHECK /* establece reglas de validacón para los datos*/
	DEFAULT /* valor por defecto*/
	INDEX /* acelera las búsquedas bajo este campo*/