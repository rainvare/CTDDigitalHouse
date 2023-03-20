create table bill
(
    id_bill       varchar(255) not null,
    customer_bill varchar(255),
    product_bill  varchar(255),
    total_price   double,
    billing_date   date,
    primary key (id_bill)
);