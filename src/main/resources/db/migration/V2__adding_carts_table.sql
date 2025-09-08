create table carts
(
    id           uuid default uuid_generate_v4() not null
        constraint carts_pk
            primary key,
    date_created date default CURRENT_DATE       not null
);

create table cart_items
(
    id         bigserial         not null
        constraint cart_items_pk
            primary key,
    cart_id    uuid              not null
        constraint cart_items_carts_id_fk
            references carts (id)
            on delete cascade,
    product_id bigint
        constraint cart_items_products_id_fk
            references products
            on delete cascade,
    quantity   integer default 1 not null,
    constraint cart_items_cart_product_unique
        unique (cart_id, product_id)
);


