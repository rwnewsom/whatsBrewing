USE master
GO

-- Drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

-- Create Tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE breweries (
	brewery_id int IDENTITY(1,1) NOT NULL,
	brewery_name varchar(50) NOT NULL,
	brewery_description varchar(500) NOT NULL,
	CONSTRAINT PK_brewery PRIMARY KEY (brewery_id)
);

CREATE TABLE address (
	address_id int IDENTITY(1,1) NOT NULL,
	city_name varchar(50) NOT NULL,
	street_number varchar(500) NOT NULL,
	street_name varchar(100) NOT NULL,
	state varchar(20) NOT NULL,
	zip_code int NOT NULL,
	phone_number varchar(20) NOT NULL,
	brewery int NOT NULL,
	url nvarchar(100) NOT NULL,
	CONSTRAINT PK_address PRIMARY KEY (address_id),
	FOREIGN KEY (brewery) REFERENCES breweries(brewery_id)
);


--CONSTRAINT pk_countrylanguage_countrycode_language PRIMARY KEY (countrycode, language),  --  CONSTRAINT fk_countrylanguage_countrycode FOREIGN KEY (countrycode) REFERENCES country(code)



-- Populate default data for testing: user and admin with password of 'password'
-- Testing
-- These values should not be kept when going to Production
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user');
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin');

INSERT INTO breweries (brewery_name, brewery_description) VALUES ('BrewDog', 'No-nonsense chain bar specialising in the Scottish brewery''s craft beers, with regular guest brews.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Seventh Son Brewing Co.', 'Brewery specializing in ales & IPAs with a bright, rustic tasting room & visiting food trucks.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Wolf''s Ridge Brewing', 'This brewery offers free Saturday tours plus an elevated American eatery with a sizable beer menu.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Columbus Brewing Company', 'Columbus Brewing Company is an independent craft brewery dedicated to exploring the flavors of American hops. Best known for Columbus IPA and Bodhi, we also enjoy the subtleties of German-style lagers, the intense characteristics of barrel aged beers and everything in between. We have designed and built our new brewery to make more beer, but also to allow us to explore new frontiers.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Barley''s Brewing Company', 'Laid-back brewery offering craft beers plus serving American grub including burgers.');

INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Columbus', '1175', 'N High St', 'Ohio', '43201', '(614) 908-3053', '1', 'https://www.brewdog.com/usa/bars/usa/brewdog-short-north')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Columbus', '1101', 'N 4th St', 'Ohio', '43201', '(614) 421-2337', '2', 'https://www.seventhsonbrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Columbus', '215', 'N 4th St', 'Ohio', '43215', '(614) 429-3936', '3', 'https://www.wolfsridgebrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Columbus', '2555', 'Harrison Rd', 'Ohio', '43204', '(614) 224-3626', '4', 'https://columbusbrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Columbus', '467', 'N High St', 'Ohio', '43215', '(614) 228-2537', '5', 'https://www.barleysbrewing.com/')

SELECT * FROM breweries

SELECT * FROM address

GO