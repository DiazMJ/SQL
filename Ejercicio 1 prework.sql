""". Crear una tabla llamada "Clientes" con las columnas:id(entero, clave primaria),
nombre (texto) y email (texto).
2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com".
3. Actualizar el email del cliente con id=1 a "juan@gmail.com".
4. Eliminar el cliente con id=1 de la tabla "Clientes".
5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero).
6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,
producto="Camiseta" y cantidad=2.
7. Actualizar la cantidad del pedido con id=1 a 3.
8. Eliminar el pedido con id=1 de la tabla "Pedidos".
9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal).
10. Insertar varios productos en la tabla "Productos" con diferentes valores.
11. Consultar todos los clientes de la tabla "Clientes".
12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los
clientes correspondientes.
13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.
14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o
igual a 5.
15.Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra
"A".
16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos
realizados por cada cliente.
17. Realizar una consulta que muestre el nombre del producto y la cantidad total de
pedidos de ese producto.
18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.
19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla
"Productos" en la columna "producto".
20. Realizar una consulta que muestre los nombres de los clientes, los nombres de
los productos y las cantidades de los pedidos donde coincida la clave externa.
"""

CREATE TABLE CLIENTES(
id SERIAL PRIMARY KEY,
nombre varchar(20),
email varchar(30))

INSERT INTO public.clientes(id,nombre, email)
Values 
(1,'Juan','juan@example.com') 

INSERT INTO public.clientes(id,nombre, email)
Values 
(2,'Renata','renata@mepierdo.com')

INSERT INTO public.clientes(id,nombre, email)
Values 
(3,'Julio','porvenir@lose.com')

INSERT INTO public.clientes(nombre, email)
values
('Pepe','pepe@gmail.com'),
('Maria','maria@yahoo,es')

DELETE FROM public.clientes
WHERE id=15;

UPDATE public.clientes
SET email=('juan@gmail.com')
where id=1

create table pedidos(
id serial primary key,
cliente_id int not null,
producto varchar(50),
cantidad int,
FOREIGN KEY(cliente_id) references CLIENTES(id)
)

INSERT INTO public.pedidos(id,cliente_id,producto,cantidad)
values 
(1,1,'camiseta',2),
(20,2,'chaqueta',4),
(3,3,'bolso',10),
(4,4,'tenis',15),
(5,5,'vaqueros',10)



UPDATE public.pedidos
SET cantidad = 3
where id=1

DELETE FROM public.pedidos
WHERE id = 1;

CREATE TABLE productos(
id SERIAL PRIMARY KEY,
Nombre VARCHAR (20),
Precio FLOAT
)

INSERT INTO public.productos(id,Nombre,Precio)
values 
(1,'Maria',200),
(2,'David',576.99),
(3,'Martín',800),
(4,'Marietta',880)

SELECT * FROM public.clientes
 """ para poder seguir con el ejercicio, he hecho un update dado que en nombres de la tabla prpducto utilicé nombres propiso en vez de productos"""

UPDATE public.productos
SET Nombre =('Chaqueta')
where id=1

UPDATE public.productos
SET Nombre =('Tenis')
where id=2.

UPDATE public.productos
SET Nombre =('Vaqueros')
where id=3

UPDATE public.productos
SET Nombre =('Bolso')
where id=4

SELECT public.clientes.nombre, public.pedidos.producto
from public.clientes
INNER JOIN public.pedidos on public.clientes.id = public.pedidos.id

SELECT * FROM public.productos
WHERE precio>50

SELECT * FROM public.pedidos
WHERE cantidad >= 5

SELECT * FROM public.clientes
WHERE nombre LIKE'D%'

SELECT * FROM public.clientes
ORDER BY id ASC

UPDATE public.clientes
set nombre=('Felita ') where id= 5

UPDATE public.clientes
set nombre=('Jesús ') where id =8 

UPDATE public.clientes
set nombre=('Juan Luis') where id= 1

UPDATE public.clientes
set email = ('sin especificar') where email IS null

SELECT public.clientes.nombre, public.pedidos.cantidad
from public.clientes
INNER JOIN public.pedidos on public.clientes.id = public.pedidos.id

SELECT public.productos.nombre, public.pedidos.cantidad
from public.productos
INNER JOIN public.pedidos on public.productos.id = public.pedidos.id

ALTER TABLE public.pedidos
ADD column fecha DATE

SELECT * FROM public.productos


ALTER TABLE public.pedidos
ADD FOREIGN KEY(cliente_ID) REFERENCES PRODUCTOS(id)

""" voy a insertar mas productos en la tabla pedidos para poder seguir con el ejercicio, ya que me da error al craer la clave foranea)"""

INSERT INTO public.productos(id,nombre,precio)
Values
(5,'camiseta',19.99)

UPDATE public.productos
SET nombre = ('Camiseta')
where id=5

ALTER TABLE public.pedidos
ADD CONSTRAINT UK_producto
UNIQUE (producto)

SELECT public.clientes.nombre, public.pedidos.producto , public.pedidos.cantidad
from public.clientes
INNER JOIN public.pedidos on public.clientes.id = public.pedidos.id




