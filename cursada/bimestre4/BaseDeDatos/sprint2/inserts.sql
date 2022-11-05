/* insert de datos */

-- CATEGORIAS
INSERT INTO categories()
VALUES (1, "Hoteles", "10.195", "https://wesped-images.s3.us-east-2.amazonaws.com/Categories/hoteles-category-image.png"),
(2, "Hostels", "16.127", "https://wesped-images.s3.us-east-2.amazonaws.com/Categories/hostels-category-image.png"),
(3, "Departamentos", "186.734", "https://wesped-images.s3.us-east-2.amazonaws.com/Categories/departamentos-category-image.png"),
(4, "Bed and Breakfast", "8.259", "https://wesped-images.s3.us-east-2.amazonaws.com/Categories/bed_and_breakfast-category-image.png");

-- CIUDADES
INSERT INTO cities()
VALUES (1, "Buenos Aires","Argentina"),
(2, "San Carlos de Bariloche","Argentina"),
(3, "Mendoza","Argentina"),
(4, "Córdoba","Argentina");

-- FEATURES
INSERT INTO features()
VALUES(1, "Wifi", "FaWifi"),
(2, "Piscina", "FaSwimmer"),
(3, "Accesible", "FaWheelchair"),
(4, "Acepta animales", "FaCat"),
(5, "Restaurante", "FaUtensils"),
(6, "Climatizado", "FaTemperatureLow"),
(7,"Estacionamiento","FaCar");


-- POLICY
INSERT INTO policy()
VALUES(1, "CheckIn", "10:00"),
(2, "CheckIn", "11:00"),
(3, "Fumar", "No se permite fumar"),
(4, "Fumar", "Se permite fumar"),
(5, "Fiestas", "No se permiten fiestas"),
(6, "Fiestas", "Se permiten fiestas en áreas comunes como el SUM"),
(7, "Salud", "Se aplican las pautas de distanciamiento social y normas sanitarias por coronavirus"),
(8, "Humo", "Detector de humo"),
(9, "Seguridad", "Deposito de seguridad"),
(10, "Cancelacion", "Agregá fechas de tu viaje para obtener los detalles de cancelación de esta estadía.");


-- PRODUCT
INSERT INTO product()
/*hoteles*/
VALUES(1, "Holiday Express","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!",-34.5978903381827, -58.371014549772056 , 5.0, 1, 1, 1),
(2, "Grand Hotel","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -41.13317700403088, -71.30674827744254, 4.3, 1, 2, 1),
(3, "Plaza","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -31.420645235586406, -64.18736939199188, 4.5, 1, 4, 1),
(4, "Hotel Central","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -32.876610312323514, -68.8494516973713,  4.0,1, 3, 1),
(5, "Pigmalion Hotel","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!",  -34.58566937393639, -58.387990979673894 , 3.9,1, 1, 1),

/*hostel*/
(6, "Hostal Manzanares","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -34.6202613104774, -58.37502113148668 , 4.5,1, 1, 2),
(7, "Hostel Tres Hermanos","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -41.136721523056536, -71.31214780511011, 5.0, 1,2, 2),
(8, "Villa Verde","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -32.87964464121688, -68.85470876583913, 3.8, 1, 3, 2),
(9, "Refugio Hostel","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -31.4095045184301, -64.18611695003233, 4.7, 1, 4, 2),
(10, "Golden Hostel","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -34.61725051907827, -58.370525749173325, 3.6, 1, 1, 2),

/*Departamentos*/
(11, "Departamentos Lux","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -34.58583637424699, -58.41225854863785 , 4.8, 1, 1, 3),
(12, "Residencias Ávila","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!",-41.13790014374107, -71.2972011764508, 3.8, 1, 2, 3),
(13, "Condominios King","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -32.892145112623574, -68.85456952988149, 4.2, 1, 3, 3),
(14, "Turmalinas","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -31.412217877689272, -64.18120352388337 , 5.0, 1, 4, 3),
(15, "Departamentos Casa Grande","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!",-34.55165269397749, -58.461479324128454, 4.0, 1, 1, 3),

/*B&B*/
(16, "Baires Bed and Breakfast","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -34.589420321683896, -58.391189137491644, 4.6, 1, 1, 4),
(17, "Querido Bed and Breakfast","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!",-41.133811475410525, -71.29589079004533, 3.8, 1, 2, 4),
(18, "B&B de la casa","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -32.88989778851921, -68.84302309583546, 5.0, 1, 3, 4),
(19, "Do Río, Bed and Breakfast","Lorem ipsum dolor sit amet. Est explicabo voluptas et molestias deleniti qui minima porro est perspiciatis sapiente qui rerum omnis? Sed obcaecati mollitia et quia deleniti hic quisquam necessitatibus!", -31.42471476170252, -64.18351572442405, 4.5, 1, 4, 4);

-- PRODUCT_HAS_FEATURE (id product + id feature)
INSERT INTO product_has_features()
VALUES(1,1),(1,2),(1,6),
(2,2), (2,4), (2,6), 
(3,4),(3,6),(3,5),
(4,1), (4,3), (4,6), 
(5,7),(5,1),(5,5),
(6,2), (6,1), (6,6),
(7,1),(7,3),(7,5),
(8,2), (8,4), (8,6),
(9,1), (9,7), (9,6), 
(10,1),(10,3),(10,5),
(11,1),(11,6),(11,5),
(12,2), (12,1), (12,7),
(13,1),(13,3),(13,5),
(14,2), (14,1), (14,6),
(15,1),(15,7),(15,5),
(16,2), (16,5), (16,6),
(17,1),(17,2),(17,5),
(18,1), (18,4), (18,6), 
(19,1), (19,5), (19,6);


-- PRODUCT_HAS_POLICY (id product + id feature)
INSERT INTO product_has_policy()
VALUES(1,1),(1,3),(1,5),(1,7), (1,8), (1,9), (1,10),
(2,2), (2,4), (2,6), (2,7), (2,8), (2,9), (2,10),
(3,1),(3,3),(3,5),(3,7), (3,8), (3,9), (3,10),
(4,2), (4,4), (4,6), (4,7), (4,8), (4,9), (4,10),
(5,1),(5,3),(5,5),(5,7), (5,8), (5,9), (5,10),
(6,2), (6,4), (6,6), (6,7), (6,8), (6,9), (6,10),
(7,1),(7,3),(7,5),(7,7), (7,8), (7,9), (7,10),
(8,2), (8,4), (8,6), (8,7), (8,8), (8,9), (8,10),
(9,2), (9,4), (9,6), (9,7), (9,8), (9,9), (9,10),
(10,1),(10,3),(10,5),(10,7), (10,8), (10,9), (10,10),
(11,1),(11,3),(11,5),(11,7), (11,8), (11,9), (11,10),
(12,2), (12,4), (12,6), (12,7), (12,8), (12,9), (12,10),
(13,1),(13,3),(13,5),(13,7), (13,8), (13,9), (13,10),
(14,2), (14,4), (14,6), (14,7), (14,8), (14,9), (14,10),
(15,1),(15,3),(15,5),(15,7), (15,8), (15,9), (15,10),
(16,2), (16,4), (16,6), (16,7), (16,8), (16,9), (16,10),
(17,1),(17,3),(17,5),(17,7), (17,8), (17,9), (17,10),
(18,2), (18,4), (18,6), (18,7), (18,8), (18,9), (18,10),
(19,2), (19,4), (19,6), (19,7), (19,8), (19,9), (19,10);



-- IMAGES 
INSERT INTO images()
-- prod1
VALUES(1,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-1/Product1-Bed1.jpg",1),
(2,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-1/Product1-Bed2.jpg",1),
(3,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-1/Product1-Bath1.jpg",1),
(4,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-1/Product1-Bath2.jpg",1),
(5,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-1/Product1-Living1.jpg",1),
(6,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-1/Product1-Living2.jpg",1),
(7,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-1/Product1-View1.jpg",1),
(8,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-1/Product1-View2.jpg",1),
(9,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-1/Product1-Place1.jpg",1),
(10,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-1/Product1-Place2.jpg",1),
-- prod2
(11,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-2/Product2-Bed1.jpg",2),
(12,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-2/Product2-Bed2.jpg",2),
(13,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-2/Product2-Bath1.jpg",2),
(14,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-2/Product2-Bath2.jpg",2),
(15,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-2/Product2-Living1.jpg",2),
(16,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-2/Product2-Living2.jpg",2),
(17,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-2/Product2-View1.jpg",2),
(18,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-2/Product2-View2.jpg",2),
(19,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-2/Product2-Place1.jpg",2),
(20,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-2/Product2-Place2.jpg",2),
-- prod3
(21,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-3/Product3-Bed1.jpg",3),
(22,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-3/Product3-Bed2.jpg",3),
(23,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-3/Product3-Bath1.jpg",3),
(24,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-3/Product3-Bath2.jpg",3),
(25,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-3/Product3-Living1.jpg",3),
(26,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-3/Product3-Living2.jpg",3),
(27,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-3/Product3-View1.jpg",3),
(28,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","hhttps://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-3/Product3-View2.jpg",3),
(29,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-3/Product3-Place1.jpg",3),
(30,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-3/Product3-Place2.jpg",3),

-- prod4
(31,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-4/Product4-Bed1.jpg",4),
(32,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-4/Product4-Bed2.jpg",4),
(33,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-4/Product4-Bath1.jpg",4),
(34,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-4/Product4-Bath2.jpg",4),
(35,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-4/Product4-Living1.jpg",4),
(36,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-4/Product4-Living2.jpg",4),
(37,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-4/Product4-View1.jpg",4),
(38,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-4/Product4-View2.jpg",4),
(39,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-4/Product4-Place1.jpg",4),
(40,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-4/Product4-Place2.jpg",4),

-- prod5
(41,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-5/Product5-Bed1.jpg",5),
(42,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-5/Product5-Bed2.jpg",5),
(43,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-5/Product5-Bath1.jpg",5),
(44,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-5/Product5-Bath2.jpg",5),
(45,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-5/Product5-Living1.jpg",5),
(46,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-5/Product5-Living2.jpg",5),
(47,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-5/Product5-View1.jpg",5),
(48,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-5/Product5-View2.jpg",5),
(49,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-5/Product5-Place1.jpg",5),
(50,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-5/Product5-Place2.jpg",5),

-- prod6
(51,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-6/Product6-Bed1.jpg",6),
(52,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",6),
(53,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",6),
(54,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",6),
(55,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",6),
(56,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",6),
(57,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",6),
(58,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",6),
(59,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",6),
(60,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",6),

-- prod7
(61,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-7/Product7-Bed1.jpg",7),
(62,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",7),
(63,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",7),
(64,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",7),
(65,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",7),
(66,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",7),
(67,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",7),
(68,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",7),
(69,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",7),
(70,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",7),
-- prod8
(71,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-8/Product8-Bed1.jpg",8),
(72,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",8),
(73,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",8),
(74,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",8),
(75,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",8),
(76,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",8),
(77,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",8),
(78,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",8),
(79,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",8),
(80,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",8),

-- prod9
(81,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-9/Product9-Bed1.jpg",9),
(82,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",9),
(83,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",9),
(84,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",9),
(85,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",9),
(86,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",9),
(87,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",9),
(88,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",9),
(89,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",9),
(90,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",9),

-- prod 10
(91,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-10/Product10-Bed1.jpg",10),
(92,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",10),
(93,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",10),
(94,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",10),
(95,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",10),
(96,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",10),
(97,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",10),
(98,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",10),
(99,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",10),
(100,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",10),

-- prod11
(101,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-11/Product11-Bed1.jpg",11),
(102,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",11),
(103,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",11),
(104,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",11),
(105,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",11),
(106,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",11),
(107,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",11),
(108,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",11),
(109,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",11),
(110,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",11),
-- prod12
(111,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-12/Product12-Bed1.jpg",12),
(112,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",12),
(113,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",12),
(114,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",12),
(115,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",12),
(116,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",12),
(117,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",12),
(118,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",12),
(119,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",12),
(120,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",12),
-- prod13
(121,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-13/Product13-Bed1.jpg",13),
(122,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",13),
(123,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",13),
(124,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",13),
(125,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",13),
(126,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",13),
(127,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",13),
(128,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",13),
(129,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",13),
(130,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",13),

-- prod14
(131,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-14/Product14-Bed1.jpg",14),
(132,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",14),
(133,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",14),
(134,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",14),
(135,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",14),
(136,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",14),
(137,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",14),
(138,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",14),
(139,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",14),
(140,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",14),

-- prod15
(141,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-15/Product15-Bed1.jpg",15),
(142,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",15),
(143,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",15),
(144,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",15),
(145,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",15),
(146,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",15),
(147,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",15),
(148,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",15),
(149,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",15),
(150,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",15),

-- prod16
(151,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-16/Product16-Bed1.jpg",16),
(152,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",16),
(153,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",16),
(154,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",16),
(155,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",16),
(156,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",16),
(157,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",16),
(158,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",16),
(159,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",16),
(160,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",16),

-- prod17
(161,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-17/Product17-Bed1.jpg",17),
(162,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",17),
(163,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",17),
(164,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",17),
(165,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",17),
(166,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",17),
(167,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",17),
(168,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",17),
(169,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",17),
(170,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",17),
-- prod18
(171,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-18/Product18-Bed1.jpg",18),
(172,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",18),
(173,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",18),
(174,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",18),
(175,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",18),
(176,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",18),
(177,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",18),
(178,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",18),
(179,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",18),
(180,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",18),

-- prod19
(181,"habitacion1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-19/Product19-Bed1.jpg",19),
(182,"habitacion2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bed2.jpg",19),
(183,"banio1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath1.jpg",19),
(184,"banio2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Bath2.jpg",19),
(185,"sala1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living1.jpg",19),
(186,"sala2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Living2.jpg",19),
(187,"vista1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View1.jpg",19),
(188,"vista2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-View2.jpg",19),
(189,"entrada1","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place1.jpg",19),
(190,"entrada2","Lorem ipsum dolor sit amet. Eum quibusdam galisum eum autem","https://wesped-images.s3.us-east-2.amazonaws.com/Products/Product-Generics/Product-Place2.jpg",19);






