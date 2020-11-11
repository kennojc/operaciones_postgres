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

