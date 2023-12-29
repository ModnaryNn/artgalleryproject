--update users information
UPDATE users
SET first_name = firstName, last_name = lastName, phone = phone, address = address
WHERE id = userID;

-- get account information
SELECT *  FROM accounts WHERE id = (SELECT account_ID FROM users WHERE ID = ?)

-- change password
UPDATE accounts SET password = ? WHERE id = (SELECT account_ID FROM users WHERE ID = ?)

-- get items in exhibition
SELECT * FROM ( items INNER JOIN artworks on artworks.id =items.artwork_id) WHERE items.exhibition_id = 1;

-- get list of items from a gallery which were not already in an exhibition
SELECT * FROM artworks WHERE artworks.id NOT IN(SELECT artwork_id FROM items WHERE exhibition_id = 1);

--remove items from an exhibition
DELETE FROM items WHERE exhibition_id = ? AND artwork_id = ?;
