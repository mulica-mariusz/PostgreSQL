
CREATE TABLE IF NOT EXISTS "User" (
	Username VARCHAR(50) UNIQUE PRIMARY KEY,
	Email VARCHAR(50) UNIQUE,
	Pass VARCHAR(50),
	Account_created TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Post (
	Post_ID SERIAL PRIMARY KEY,
	Username VARCHAR(50),
	Title VARCHAR(50),
	Post_created TIMESTAMP,
	Post_text TEXT,
	CONSTRAINT fk_user
		FOREIGN KEY(Username)
			REFERENCES "User"(Username)
);

CREATE TABLE IF NOT EXISTS Category (
	Category_ID SERIAL PRIMARY KEY,
	Category_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Attachment (
	Attachment_ID SERIAL PRIMARY KEY,
	Post_ID INT,
	Attach_name VARCHAR(100),
	CONSTRAINT fk_post
		FOREIGN KEY(Post_ID)
			REFERENCES Post(Post_ID)
	
);

CREATE TABLE IF NOT EXISTS "Comment" (
	Comment_ID SERIAL PRIMARY KEY,
	Username VARCHAR(50),
	Post_ID INT,
	Com_created TIMESTAMP,
	Com_text TEXT,
	Com_parent_ID INT
);

CREATE TABLE IF NOT EXISTS Comment_like (
	Like_ID SERIAL PRIMARY KEY,
	Comment_ID INT,
	Username VARCHAR(50),
	Liked BOOLEAN
	
);

CREATE TABLE IF NOT EXISTS Post_category (
	Post_ID INT,
	Category_ID INT
);

ALTER TABLE Post_category
ADD CONSTRAINT fk_post
	FOREIGN KEY (Post_ID)
		REFERENCES Post(Post_ID),
ADD CONSTRAINT fk_category
	FOREIGN KEY (Category_ID)
		REFERENCES Category(Category_ID);
		
ALTER TABLE "Comment"
ADD CONSTRAINT fk_post
	FOREIGN KEY (Post_ID)
		REFERENCES Post(Post_ID),
ADD CONSTRAINT fk_user
	FOREIGN KEY (Username)
		REFERENCES "User"(Username);
		
ALTER TABLE Comment_like
ADD CONSTRAINT fk_com
	FOREIGN KEY (Comment_ID)
		REFERENCES "Comment"(Comment_ID),
ADD CONSTRAINT fk_user
	FOREIGN KEY (Username)
		REFERENCES "User"(Username);
		
		

