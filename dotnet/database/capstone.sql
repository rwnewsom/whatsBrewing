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


--CONSTRAINT pk_countrylanguage_countrycode_language PRIMARY KEY (countrycode, language),
  --  CONSTRAINT fk_countrylanguage_countrycode FOREIGN KEY (countrycode) REFERENCES country(code)



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

INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Rhinegeist Brewery', 'Taproom located in a historic bottling plant offering house-brewed beers, Ping-Pong, cornhole & TVs.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('MadTree Brewing', 'Bustling taproom offering craft beers, wood-fired pizzas, growler fills & keg sales, plus a patio.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Listermann Brewing Company', 'Enduring microbrewery with handcrafted bottled ales, a growler station & a homebrew supply store.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Urban Artifact', 'Craft brewery specializing in the fruited and sour featuring a taproom, full bar, and live music venue.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Fibonacci Brewing Company', 'Nanobrewery that produces high quality craft beers in a laid back, casual environment.');

INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Platform Beer Co.', 'From humble beginnings, brewing on a 3 bbl brewhouse in Cleveland, Platform has expanded to a second tasting room in Columbus, a production facility in Cleveland, a Cincinnati tasting room named LOCOBA and a sour beer facility in Cleveland named Phunkenship.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Nano Brew Cleveland', 'Laid-back brewery offering craft beers plus serving American grub including burgers.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Great Lakes Brewing Company', 'Iconic microbrewery with house suds, an updated American menu, free tours & a patio.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Masthead Brewing Co.', 'Expansive brewery & taproom pouring American & Belgian beer paired with wood-fired pizza.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Noble Beast Brewing Co.', 'Lively taproom for house-brewed beers & elevated bar snacks, sandwiches and salads.');

INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Yards Brewing Company', 'Expansive brewery, restaurant & bar with event space, outdoor seating & retail shop.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Crime and Punishment Brewing Company', 'Chill brewpub with house beers & Russian-inspired food in industrial digs.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Evil Genius Beer Company', 'Brewpub for the company''s popular beers with small bites in an industrial-chic hangout.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Philadelphia Brewing Co', 'Beer sales along with weekly tastings & tours in a brewery originally built in 1885.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Love City Brewing', 'Spacious brewery & tasting room with visiting food trucks in a former rail-parts factory.');

INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Dancing Gnome Beer', 'Industrial brewery taproom pouring craft beers in inviting digs with a view of the production area.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Strange Roots Experimental Ales', 'This artisanal brewery has a pub-style taproom that offers a rotating selection of small-batch ales.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Penn Brewery', 'Long-standing brewery features German-style brews, diverse comfort fare, regular live music & tours.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('East End Brewing Company', 'Local brewery offering tours, a tasting room & house beers for sale by the growler or keg.');
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Burgh''ers Brewing Lawrenceville', 'Upbeat spot offering build-your-own burgers & other locally sourced fare, plus shakes & sodas.');


INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Columbus', '1175', 'N High St', 'OH', '43201', '(614) 908-3053', '1', 'https://www.brewdog.com/usa/bars/usa/brewdog-short-north')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Columbus', '1101', 'N 4th St', 'OH', '43201', '(614) 421-2337', '2', 'https://www.seventhsonbrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Columbus', '215', 'N 4th St', 'OH', '43215', '(614) 429-3936', '3', 'https://www.wolfsridgebrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Columbus', '2555', 'Harrison Rd', 'OH', '43204', '(614) 224-3626', '4', 'https://columbusbrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Columbus', '467', 'N High St', 'OH', '43215', '(614) 228-2537', '5', 'https://www.barleysbrewing.com/')

INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cincinnati', '1910', 'Elm St', 'OH', '45202', '(513) 381-1367', '6', 'https://rhinegeist.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cincinnati', '3301', 'Madison Rd', 'OH', '45209', '(513) 836-8733', '7', 'https://www.madtreebrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cincinnati', '1621', 'Dana Ave', 'OH', '45207', '(513) 731-1130', '8', 'https://www.listermannbrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cincinnati', '1660', 'Blue Rock St', 'OH', '45223', '(513) 542-4222', '9', 'https://www.artifactbeer.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cincinnati', '1445', 'Compton Rd', 'OH', '45231', '(513) 832-1422', '10', 'http://fibbrew.com/')

INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cleveland', '1470', 'Lakeside Ave E', 'OH', '44114', '(216) 417-8588', '11', 'https://www.noblebeastbeer.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cleveland', '1859', 'W 25th St', 'OH', '44113', '(216) 862-6631', '12', 'https://www.nanobrewcleveland.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cleveland', '2516', 'Market Ave', 'OH', '44113', '(216) 771-4404', '13', 'https://www.greatlakesbrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cleveland', '1261', 'Superior Ave', 'OH', '44114', '(216) 206-6176', '14', 'https://mastheadbrewingco.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cleveland', '1470', 'Lakeside Ave E', 'OH', '44114', '(216) 417-8588', '15', 'https://www.noblebeastbeer.com/')

INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Philadelphia', '500', 'Spring Garden St', 'PA', '19123', '(215) 525-0175', '16', 'https://yardsbrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Philadelphia', '2711', 'W Girard Ave', 'PA', '19130', '(215) 235-2739', '17', 'http://crimeandpunishmentbrewingco.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Philadelphia', '1727', 'N Front St', 'PA', '19122', '(215) 425-6820', '18', 'http://evilgeniusbeer.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Philadelphia', '2440', 'Frankford Ave', 'PA', '19125', '(215) 427-2739', '19', 'http://philadelphiabrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Philadelphia', '1023', 'Hamilton St', 'PA', '19123', '(215) 398-1900', '20', 'https://lovecitybrewing.com/')

INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Pittsburgh', '925', 'Main St', 'PA', '15215', '(412) 408-2083', '21', 'https://dancinggnomebeer.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Pittsburgh', '501', 'E Ohio St', 'PA', '15209', '(915) 209-5105', '22', 'http://www.strangerootsbeer.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Pittsburgh', '800', 'Vinial St', 'PA', '15212', '(412) 237-9400', '23', 'https://www.pennbrew.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Pittsburgh', '147', 'Julius St', 'PA', '15206', '(412) 537-2337', '24', 'https://www.eastendbrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Pittsburgh', '3601', 'Butler St', 'PA', '15201', '(412) 904-2622', '25', 'https://burgherspgh.com/')

SELECT * FROM breweries

SELECT * FROM address

GO