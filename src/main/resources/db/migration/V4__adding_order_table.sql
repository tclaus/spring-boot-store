create table orders
(
    id          BIGSERIAL                      not null
        constraint orders_pk
            primary key,
    customer_id bigint                         not null
        constraint orders_users_id_fk
            references users,
    status      varchar(20),
    created_at  TIMESTAMP default current_date not null,
    total_price decimal(10, 2)                 not null
);

create table order_items
(
    id          bigserial      not null
        constraint order_items_pk
            primary key,
    order_id    bigint         not null
        constraint order_items_orders_id_fk
            references orders (id),
    product_id  bigint         not null
        constraint order_items_products_id_fk
            references products,
    unit_price  decimal(10, 2) not null,
    quantity    integer        not null,
    total_price decimal(10, 2) not null
);

