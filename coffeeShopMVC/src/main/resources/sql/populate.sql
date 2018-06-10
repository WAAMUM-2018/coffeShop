INSERT INTO db_coffeeshop.user(username, password, enabled)
VALUES ('admin','admin', true);

INSERT INTO db_coffeeshop.role(name)
VALUES ('USER');
INSERT INTO db_coffeeshop.role(name)
VALUES ('ADMIN');

INSERT INTO db_coffeeshop.user_role(user_id, role_id)
VALUES ('admin',2);

INSERT INTO db_coffeeshop.person(email, first_name, last_name, phone, user_id,enable)
VALUES ('admin@gmail.com','Admin', 'admin', '123','admin',1);