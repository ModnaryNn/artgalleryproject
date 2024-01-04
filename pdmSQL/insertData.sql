	USE artgallery;

	INSERT INTO roles (role_name)
	VALUE 	("admin")
			, ("user")
			, ("gallery")
			, ("shipper");

	INSERT INTO accounts(username,password,role_id)
	VALUE 	("admin", "password", 1)
			,("shipper1", "123", 4)
			,("shipper2", "1234",4)
			,("shipper3","12345",4)
			,("gallery1", "123", 3)
			,("gallery2", "1234", 3)
			,("gallery3","12345",3)
			,("user1", "abc", 2)
			,("user2", "abcd", 2)
			,("user3","abcde",2)
	;

	INSERT INTO shippers(shipper_name, phone, account_id)
	VALUE 	("VIETTEL POST",  03456789, 2)
			, ("SPX",19001353,3)
			, ("VNPOST",17575555,4)
	;

	INSERT INTO galleries(gallery_name, address, account_id)
	VALUE   ("Van Gogh Museum", "Museumplein 6, 1071 DJ Amsterdam",5)
			, ("The Dali (Salvador Dali Museum)", "1 Dali Blvd, St. Petersburg",6)
			, ("Marmottan Monet Musee","2 Rue Louis Boilly, 75016 Paris",7)
	;

	INSERT INTO users(first_name, last_name, phone, address, account_id)
	VALUE 	("Nguyen", "Nguyen", "0355579044", "115 QL1A, HCM",8)
			, ("Khoa", "To", "0965432277", "27 S11, THU DUC",9)
			,("Phan","Tai","0901991239","666 Dai lo Dong Tay, Binh Tan, HCM",10)
	;

	INSERT INTO artists (fullname,about,birth_year,death_year)
	VALUE 	("Vincent Van Gogh","This Dutch Post-Impressionist artist is considered to be one of the greatest painters of all time. ",1853,1890)
		, ("Leonardo da Vinci","The celebrated Italian polymath created some of the most famous paintings of all time.",1452,1519)
		, ("Salvador Dali","The king of Surrealism, Salvador Dali was a Spanish artist who explored the realm of the subconscious in his art.",1904,1989)
		, ("Edvard Munch","A Norwegian painter born in 1863, Edvard Munch was quite a tortured soul.",1863,1944)
		, ("Johannes Vermeer","This 17th century Dutch painter specialized in intimate domestic scenes, often portraying women.",1632,1675)
		, ("Claude Monet", "The iconic French Impressionist painter Claude Monet was a proponent of open-air landscape painting.",1840,1926)
	;	

	INSERT INTO artworks(title, about, created_year,is_for_sale,price, gallery_id, artist_id)
	VALUE     ("Self-Portrait with Grey Felt Hat","Van Gogh painted this self-portrait",1887,false,0,1,1 )
			, ("Almond Blossom","Almond BlossomLarge blossom branches like this against a blue sky were one of Van Goghs favourite subjects.",1890,true,2000,1,1 )
			, ("The Old Church Tower at Nuenen ('The Peasants' Churchyard')","Van Gogh lived near this ruined church tower in Nuenen, in the Dutch province of North Brabant. The tower had remained standing when the church collapsed a century earlier, but at the time of this painting it was being demolished. The steeple is already gone.", 1885, false, 0 ,1,1 )
			, ("The Walk Woman With A Parasol","The Walk Woman With A Parasol portrait painted by Claude Monet", 1875,true, 3000,3,6)
			, ("Woman in the Garden", "Woman in the Garden (French: Femme au jardin) (or Jeanne-Marguerite Lecadre in the Garden) is a painting begun in 1866 by Claude Monet when he was a young man of 26.",1866, false,0, 3,6)
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
		, ("Claude Monet exhibition", "Claude Monet exhibition show Woman in the Garden painting","2023-01-01","2023-01-30",3)
	
	;

	INSERT INTO items(exhibition_id, artwork_id)
	VALUE 	(1,1)
			, (1,2)
			, (1,3)
			, (2,5)
	;

	-- query