--Desafío - Creando y analizando nuestro propio blog

--2. Crear las tablas indicadas de acuerdo al modelo de datos.
CREATE TABLE usuarios(
       id INT PRIMARY KEY,
	   email VARCHAR(25)
);
select * from usuarios

CREATE TABLE post(
       id INT PRIMARY KEY,
	   usuario_id INT,
	   titulo VARCHAR(40),
	   fecha DATE,
	   FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);

select * from post

CREATE TABLE comentarios(
       id INT PRIMARY KEY,
	   usuario_id INT,
	   post_id INT,
	   texto VARCHAR(40),
	   fecha DATE,
	   FOREIGN KEY(post_id) REFERENCES post(id),
	   FOREIGN KEY(usuario_id) REFERENCES usuarios(id)	
);

select * from comentarios

--3. Insertar los siguientes registros.
--USUARIOS
INSERT INTO usuarios VALUES(1, 'usuario01@hotmail.com');
INSERT INTO usuarios VALUES(2, 'usuario02@gmail.com');
INSERT INTO usuarios VALUES(3, 'usuario03@gmail.com');
INSERT INTO usuarios VALUES(4, 'usuario04@hotmail.com');
INSERT INTO usuarios VALUES(5, 'usuario05@yahoo.com');
INSERT INTO usuarios VALUES(6, 'usuario06@hotmail.com');
INSERT INTO usuarios VALUES(7, 'usuario07@yahoo.com');
INSERT INTO usuarios VALUES(8, 'usuario08@yahoo.com');
INSERT INTO usuarios VALUES(9, 'usuario09@yahoo.com');

--POST
INSERT INTO post VALUES(1,1, 'Post 1: Esto es malo', '2020-06-29');
INSERT INTO post VALUES(2,5, 'Post 2: Esto es malo', '2020-06-20');
INSERT INTO post VALUES(3,1, 'Post 3: Esto es excelente', '2020-05-30');
INSERT INTO post VALUES(4,9, 'Post 4: Esto es bueno', '2020-05-09');
INSERT INTO post VALUES(5,7, 'Post 5: Esto es bueno', '2020-07-10');
INSERT INTO post VALUES(6,5, 'Post 6: Esto es excelente', '2020-07-18');
INSERT INTO post VALUES(7,8, 'Post 7: Esto es excelente', '2020-07-07');
INSERT INTO post VALUES(8,5, 'Post 8: Esto es excelente', '2020-05-14');
INSERT INTO post VALUES(9,2, 'Post 9: Esto es bueno', '2020-05-08');
INSERT INTO post VALUES(10,6, 'Post 10: Esto es bueno', '2020-06-02');
INSERT INTO post VALUES(11,4, 'Post 11: Esto es bueno', '2020-05-05');
INSERT INTO post VALUES(12,9, 'Post 12: Esto es malo', '2020-07-23');
INSERT INTO post VALUES(13,5, 'Post 13: Esto es excelente', '2020-05-30');
INSERT INTO post VALUES(14,8, 'Post 14: Esto es excelente', '2020-05-01');
INSERT INTO post VALUES(15,7, 'Post 15: Esto es malo', '2020-06-17');

--COMENTARIOS
INSERT INTO comentarios VALUES(1,3,6, 'Este es el comentario 1', '2020-07-08');
INSERT INTO comentarios VALUES(2,4,2, 'Este es el comentario 2', '2020-06-07');
INSERT INTO comentarios VALUES(3,6,4, 'Este es el comentario 3', '2020-06-16');
INSERT INTO comentarios VALUES(4,2,13, 'Este es el comentario 4', '2020-06-15');
INSERT INTO comentarios VALUES(5,6,6, 'Este es el comentario 5', '2020-05-14');
INSERT INTO comentarios VALUES(6,3,3, 'Este es el comentario 6', '2020-07-08');
INSERT INTO comentarios VALUES(7,6,1, 'Este es el comentario 7', '2020-05-22');
INSERT INTO comentarios VALUES(8,6,7, 'Este es el comentario 8', '2020-07-09');
INSERT INTO comentarios VALUES(9,8,13, 'Este es el comentario 9', '2020-06-30');
INSERT INTO comentarios VALUES(10,8,6, 'Este es el comentario 10', '2020-06-19');
INSERT INTO comentarios VALUES(11,5,1, 'Este es el comentario 11', '2020-05-09');
INSERT INTO comentarios VALUES(12,8,15, 'Este es el comentario 12', '2020-06-17');
INSERT INTO comentarios VALUES(13,1,9, 'Este es el comentario 13', '2020-05-01');
INSERT INTO comentarios VALUES(14,2,5, 'Este es el comentario 14', '2020-05-31');
INSERT INTO comentarios VALUES(15,4,3, 'Este es el comentario 15', '2020-06-28');


--4 Seleccionar el correo, id y título de todos los post publicados por el usuario 5.

SELECT u.id, u.email, p.titulo FROM usuarios u iNNER JOIN post p
ON u.id = p.usuario_id WHERE p.usuario_id=5;

--5 Listar el correo, id y el detalle de todos los comentarios que no hayan sido realizados
--por el usuario con email usuario06@hotmail.com

SELECT u.id, u.email, c.texto FROM usuarios u INNER JOIN comentarios c
ON u.id = c.usuario_id WHERE u.email<>'usuario06@hotmail.com';


--6 Listar los usuarios que no han publicado ningún post
SELECT u.id, u.email FROM usuarios u LEFT JOIN post p
ON u.id = p.usuario_id WHERE p.id IS not NULL;

SELECT * FROM usuarios u LEFT JOIN post p
ON u.id = p.usuario_id WHERE p.id IS NULL;

--7 Listar todos los post con sus comentarios (incluyendo aquellos que no poseen comentarios).

SELECT * FROM post p FULL OUTER JOIN comentarios c
ON p.id = c.post_id ORDER BY p.id;


--8 Listar todos los usuarios que hayan publicado un post en Junio.
SELECT u.id, u.email, p.titulo FROM usuarios u iNNER JOIN post p
ON u.id = p.usuario_id WHERE p.fecha between '2020-06-01'and '2020-06-30' ORDER BY p.fecha;


