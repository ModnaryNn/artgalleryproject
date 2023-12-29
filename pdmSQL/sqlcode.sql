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

	-- insert data

	INSERT INTO roles (role_name)
	VALUE 	("admin"),
			("user"),
			("gallery"),
			("shipper");

	INSERT INTO accounts(username,password,role_id)
	VALUE 	("admin", "password", 1)
			,("shipper1", "123", 4)
			, ("gallery1", "123", 3)
			, ("gallery2", "1234", 3)
			, ("user1", "abc", 2)
			, ("user2", "abcd", 2)
	;

	INSERT INTO artists (fullname,about,birth_year,death_year)
	VALUE 	("Vincent Van Gogh","This Dutch Post-Impressionist artist is considered to be one of the greatest painters of all time. ",1853,1890)
			, ("Leonardo da Vinci","The celebrated Italian polymath created some of the most famous paintings of all time.",1452,1519)
			, ("Salvador Dali","The king of Surrealism, Salvador Dali was a Spanish artist who explored the realm of the subconscious in his art.",1904,1989)
			, ("Edvard Munch","A Norwegian painter born in 1863, Edvard Munch was quite a tortured soul.",1863,1944)
			, ("Johannes Vermeer","This 17th century Dutch painter specialized in intimate domestic scenes, often portraying women.",1632,1675)
			, ("Claude Monet", "The iconic French Impressionist painter Claude Monet was a proponent of open-air landscape painting.",1840,1926)
	;

	INSERT INTO shippers(shipper_name,phone, account_id)
	VALUE 	("VIETTEL POST",  03456789, 2)
	;

	INSERT INTO users(first_name, last_name, phone, address, account_id)
	VALUE 	("Nguyen", "Nguyen", "0355579044", "115 QL1A, HCM",5)
			, ("Khoa", "To", "0965432277", "27 S11, THU DUC",6)
	;

	INSERT INTO galleries(gallery_name, address, account_id)
	VALUE   ("Van Gogh Museum", "Museumplein 6, 1071 DJ Amsterdam",3)
			, ("The Dali (Salvador Dali Museum)", "1 Dali Blvd, St. Petersburg",4)
	;

	INSERT INTO artworks(title, about, created_year,is_for_sale,price, gallery_id, artist_id)
	VALUE    ("Self-Portrait with Grey Felt Hat","Van Gogh painted this self-portrait",1887,false,0,1,1 )
			, ("Almond Blossom","Almond BlossomLarge blossom branches like this against a blue sky were one of Van Goghs favourite subjects.",1890,true,2000,1,1 )
			,("The Old Church Tower at Nuenen ('The Peasants' Churchyard')","Van Gogh lived near this ruined church tower in Nuenen, in the Dutch province of North Brabant. The tower had remained standing when the church collapsed a century earlier, but at the time of this painting it was being demolished. The steeple is already gone.", 1885, false, 0 ,1,1 )
	;
	
	INSERT INTO interactions (user_id, artwork_id, interaction_time)
	VALUE	(1,1,now())
			, (1,2,now())
			, (1,3,now())
			, (2,1,now())
	;

	INSERT INTO orders (user_id, shipper_id, artwork_id, order_time)
	VALUE (1,1,2,now())
	;

	INSERT INTO exhibitions(exhibition_name, detail,  start_date, end_date,gallery_id)
	VALUE ("Van Gough exhibition", "Van Gough's painting exhibition","2023-12-01","2023-12-30",1)
		, ("Van Gough exhibition 2", "Van Gough's painting exhibition 2","2023-12-01","2023-12-30",1)
	
	;

	INSERT INTO items(exhibition_id, artwork_id)
	VALUE 	(1,1)
			, (1,2)
			, (1,3)
			, (2,1)
	;

	-- query