CREATE SCHEMA IF NOT EXISTS db_digitalbooking;

USE db_digitalbooking;

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
id INT NOT NULL AUTO_INCREMENT,
title VARCHAR(50) NOT NULL,
description VARCHAR(50) NOT NULL,
urlImage VARCHAR(255) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO categories (id, title, description, urlImage) VALUES
(1, "Hoteles", "807.105 hoteles", "https://images.unsplash.com/photo-1618773928121-c32242e63f39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
(2, "Hostels", "807.105 hoteles", "https://images.unsplash.com/photo-1611892440504-42a792e24d32?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870"),
(3, "Departamentos", "807.105 hoteles", "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
(4, "Bed and breakfast", "807.105 hoteles", "https://images.unsplash.com/photo-1584132905271-512c958d674a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80");