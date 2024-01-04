	-- CREATE DATABASE
	CREATE DATABASE artgallery;
	USE artgallery;

	-- Create tables
	CREATE TABLE artworks(
		id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		, title VARCHAR(255) NOT NULL
		, about TEXT NOT NULL
		, created_year INT NOT NULL
		, is_for_sale BOOLEAN NOT NULL
		, price DECIMAL(8, 2) NOT NULL
		, gallery_id INT UNSIGNED NOT NULL
		, artist_id INT UNSIGNED NOT NULL
	);

	CREATE TABLE shippers(
		id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		, shipper_name VARCHAR(255) NOT NULL
		, phone VARCHAR(20) NOT NULL
		, account_id INT UNSIGNED NOT NULL    
	);

	CREATE TABLE exhibitions(
		id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		, exhibition_name VARCHAR(255) NOT NULL
		, detail TEXT NOT NULL
		, start_date DATE NOT NULL
		, end_date DATE NOT NULL
		, gallery_id INT UNSIGNED NOT NULL
	);


	CREATE TABLE accounts(
		id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		, username VARCHAR(255) NOT NULL UNIQUE
		, password VARCHAR(255) NOT NULL
		, role_id INT UNSIGNED NOT NULL
	);

	CREATE TABLE roles(
		id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		, role_name VARCHAR(20) NOT NULL UNIQUE
	);

	CREATE TABLE artists(
		id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		, fullname VARCHAR(255) NOT NULL
		, about TEXT NOT NULL
		, birth_year INT NOT NULL
		, death_year INT NOT NULL
	);

	CREATE TABLE orders(
		id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		, user_id INT UNSIGNED NOT NULL
		, shipper_id INT UNSIGNED NOT NULL
		, artwork_id INT UNSIGNED NOT NULL
		, order_time DATETIME NOT NULL
	);



	CREATE TABLE galleries(
		id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		, gallery_name VARCHAR(255) NOT NULL
		, address TEXT NOT NULL
		, account_id INT UNSIGNED NOT NULL
	);

	CREATE TABLE interactions(
		id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		, user_id INT UNSIGNED NOT NULL
		, artwork_id INT UNSIGNED NOT NULL
		, interaction_time DATETIME NOT NULL
	);


	CREATE TABLE users(
		id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		, first_name VARCHAR(20) NOT NULL
		, last_name VARCHAR(20) NOT NULL
		, phone VARCHAR(20) NOT NULL UNIQUE
		, address TEXT NOT NULL
		, account_id INT UNSIGNED NOT NULL
	);

	CREATE TABLE items(
		id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
		, exhibition_id INT UNSIGNED NOT NULL
		, artwork_id INT UNSIGNED NOT NULL
	);

	-- add foreign key

	ALTER TABLE users 
	ADD FOREIGN KEY(account_id) REFERENCES accounts(id);

	ALTER TABLE shippers 
	ADD FOREIGN KEY(account_id) REFERENCES accounts(id);

	ALTER TABLE galleries 
	ADD FOREIGN KEY(account_id) REFERENCES accounts(id);

	ALTER TABLE orders 
	ADD FOREIGN KEY(user_id) REFERENCES users(id),
	ADD FOREIGN KEY(shipper_id) REFERENCES shippers(id),
	ADD FOREIGN KEY(artwork_id) REFERENCES artworks(id);

	ALTER TABLE exhibitions
	ADD FOREIGN KEY(gallery_id) REFERENCES galleries(id);

	ALTER TABLE items 
	ADD FOREIGN KEY(exhibition_id) REFERENCES exhibitions(id),
	ADD FOREIGN KEY(artwork_id) REFERENCES artworks(id);

	ALTER TABLE artworks
	ADD FOREIGN KEY(gallery_id) REFERENCES galleries(id),
	ADD FOREIGN KEY(artist_id) REFERENCES artists(id);

	ALTER TABLE interactions
	ADD FOREIGN KEY(user_id) REFERENCES users(id),
	ADD FOREIGN KEY(artwork_id) REFERENCES artworks(id);

	ALTER TABLE accounts
	ADD FOREIGN KEY(role_id) REFERENCES roles(id);
