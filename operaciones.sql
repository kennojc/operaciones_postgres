-- PARTE 1 --

kennojc=# CREATE DATABASE posts;

kennojc=# \c posts

You are now connected to database "posts" as user "kennojc".

posts=# CREATE TABLE post(
posts(# id INT, username VARCHAR(25), creation_date DATE, content VARCHAR(500), description VARCHAR(500) );

-- REVISIÓN DE RESULTADO --
posts=# SELECT * FROM post;
 id | username | creation_date | content | description
----+----------+---------------+---------+-------------
(0 rows)

INSERT INTO post (id, username, creation_date, content, description) VALUES (12, 'Pamela','2020-10-19', 'reclamo', 'mal servicio, cero estrellas');
INSERT INTO post (id, username, creation_date, content, description) VALUES (25, 'Carlos','2020-10-28', 'seguimiento', 'gracias por el producto,funcionando bien');
INSERT INTO post (id, username, creation_date, content, description) VALUES (12, 'Pamela','2020-11-12', 'felicitación', 'excelente respuesta, 5 estrellas');

-- PROBANDO --
id | username | creation_date |   content    |               description
----+----------+---------------+--------------+------------------------------------------
 12 | Pamela   | 2020-10-19    | reclamo      | mal servicio, cero estrellas
 25 | Carlos   | 2020-10-28    | seguimiento  | gracias por el producto,funcionando bien
 12 | Pamela   | 2020-11-12    | felicitación | excelente respuesta, 5 estrellas
(3 rows)

posts=# ALTER TABLE post
posts-# ADD title VARCHAR(255);

UPDATE post SET title='No Responden' WHERE content='reclamo';
UPDATE post SET title='Los mejores' WHERE username='Carlos';
UPDATE post SET title='Los amo' WHERE content='felicitación';

-- ESTADO ACTUAL --
posts=# SELECT * FROM post;
 id | username | creation_date |   content    |               description                |    title
----+----------+---------------+--------------+------------------------------------------+--------------
 12 | Pamela   | 2020-10-19    | reclamo      | mal servicio, cero estrellas             | No Responden
 25 | Carlos   | 2020-10-28    | seguimiento  | gracias por el producto,funcionando bien | Los mejores
 12 | Pamela   | 2020-11-12    | felicitación | excelente respuesta, 5 estrellas         | Los amo
(3 rows)

posts=# INSERT INTO post (id, username, creation_date, content, description, title) VALUES (42, 'Pedro','2020-11-03', 'nuevo', 'Todo bien, los felicito', 'Primera compra');
INSERT 0 1
posts=# INSERT INTO post (id, username, creation_date, content, description, title) VALUES (42, 'Pedro','2020-11-05', 'seguimiento', 'Recibido muy rápido,gracias', 'Ya me llegó!');

-- ESTADO ACTUAL, ANTES DE BORRAR A CARLOS --
 id | username | creation_date |   content    |               description                |     title
----+----------+---------------+--------------+------------------------------------------+----------------
 12 | Pamela   | 2020-10-19    | reclamo      | mal servicio, cero estrellas             | No Responden
 25 | Carlos   | 2020-10-28    | seguimiento  | gracias por el producto,funcionando bien | Los mejores
 12 | Pamela   | 2020-11-12    | felicitación | excelente respuesta, 5 estrellas         | Los amo
 42 | Pedro    | 2020-11-03    | nuevo        | Todo bien, los felicito                  | Primera compra
 42 | Pedro    | 2020-11-05    | seguimiento  | Recibido muy rápido,gracias              | Ya me llegó!
(5 rows)

posts=# DELETE FROM post WHERE username='Carlos';
posts=# INSERT INTO post (id, username, creation_date, content, description, title) VALUES (25, 'Carlos','2020-11-10', 'actualización', 'Se echó a perder, malo el producto', 'Mala calidad');

-- FIN DE PARTE 1 --

-- INICIO PARTE 2 --
posts=# CREATE TABLE 
comentarios(id INT, timestmp TIMESTAMP, content VARCHAR(255));

posts=# ALTER TABLE post
ADD FOREING  KEY (id) REFERENCES comentarios(id)

INSERT INTO comentarios(id,timestmp, content) VALUES (12, '2020-11-12 12:01','gracias por avisar');
INSERT INTO comentarios(id,timestmp, content) VALUES (12, '2020-11-12 12:05','enterado');
INSERT INTO comentarios(id,timestmp, content) VALUES (25, '2020-11-12 12:06','felicidades');                       
INSERT INTO comentarios(id,timestmp, content) VALUES (25, '2020-11-12 12:16','gracias');
INSERT INTO comentarios(id,timestmp, content) VALUES (25, '2020-11-12 12:46','holA HOLa');
INSERT INTO comentarios(id,timestmp, content) VALUES (25, '2020-11-12 12:58','gracias de nuevo');

INSERT INTO post (id, username, creation_date, content, description, title) VALUES (78, 'Margarita','2020-11-11', 'ingreso', 'Recién llgué', 'Hola');
INSERT INTO comentarios(id,timestmp, content) VALUES (78, '2020-11-12 13:01','bienvenida');

INSERT INTO comentarios(id,timestmp, content) VALUES (78, '2020-11-12 13:02','bienvenida Margarita');

INSERT INTO comentarios(id,timestmp, content) VALUES (78, '2020-11-12 13:03','hola Margarita');

INSERT INTO comentarios(id,timestmp, content) VALUES (78, '2020-11-12 13:04','que se mejore');

INSERT INTO comentarios(id,timestmp, content) VALUES (78, '2020-11-12 13:05','nos vemos!');

-- TABLAS FINALES --

id | username  | creation_date |    content    |            description             |     title
----+-----------+---------------+---------------+------------------------------------+----------------
 12 | Pamela    | 2020-10-19    | reclamo       | mal servicio, cero estrellas       | No Responden
 12 | Pamela    | 2020-11-12    | felicitación  | excelente respuesta, 5 estrellas   | Los amo
 42 | Pedro     | 2020-11-03    | nuevo         | Todo bien, los felicito            | Primera compra
 42 | Pedro     | 2020-11-05    | seguimiento   | Recibido muy rápido,gracias        | Ya me llegó!
 25 | Carlos    | 2020-11-10    | actualización | Se echó a perder, malo el producto | Mala calidad
 78 | Margarita | 2020-11-11    | ingreso       | Recién llgué                       | Hola

  id |      timestmp       |       content
----+---------------------+----------------------
 12 | 2020-11-12 12:01:00 | gracias por avisar
 12 | 2020-11-12 12:05:00 | enterado
 25 | 2020-11-12 12:06:00 | felicidades
 25 | 2020-11-12 12:06:00 | felicidades
 25 | 2020-11-12 12:16:00 | gracias
 25 | 2020-11-12 12:46:00 | holA HOLa
 25 | 2020-11-12 12:58:00 | gracias de nuevo
 78 | 2020-11-12 13:01:00 | bienvenida
 78 | 2020-11-12 13:02:00 | bienvenida Margarita
 78 | 2020-11-12 13:03:00 | hola Margarita
 78 | 2020-11-12 13:04:00 | que se mejore
 78 | 2020-11-12 13:05:00 | nos vemos!

 -- FIN PARTE DOS --