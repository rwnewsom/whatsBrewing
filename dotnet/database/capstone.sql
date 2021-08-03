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

CREATE TABLE beers (
	beer_id int IDENTITY(1,1) NOT NULL,
	name varchar(100) NOT NULL,
	style varchar(100) NOT NULL,
	description varchar(500) NOT NULL,
	ABV decimal NOT NULL,
	IBU int NULL,
	brewery int NOT NULL,
	CONSTRAINT PK_beers PRIMARY KEY (beer_id),
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
INSERT INTO breweries (brewery_name, brewery_description) VALUES ('Wissahickon Brewing Company', 'Wissahickon Brewing Company (WBCo) is a family owned & operated production brewery & tasting room located in East Falls, Philadelphia, PA. We’re family & pet friendly, host food trucks every day we’re open, & continue to explore new & interesting styles, ingredients, & recipes.');
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

INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cleveland', '1470', 'Lakeside Ave E', 'OH', '44114', '(216) 417-8588', '11', 'https://platformbeer.co/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cleveland', '1859', 'W 25th St', 'OH', '44113', '(216) 862-6631', '12', 'https://www.nanobrewcleveland.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cleveland', '2516', 'Market Ave', 'OH', '44113', '(216) 771-4404', '13', 'https://www.greatlakesbrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cleveland', '1261', 'Superior Ave', 'OH', '44114', '(216) 206-6176', '14', 'https://mastheadbrewingco.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Cleveland', '1470', 'Lakeside Ave E', 'OH', '44114', '(216) 417-8588', '15', 'https://www.noblebeastbeer.com/')

INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Philadelphia', '500', 'Spring Garden St', 'PA', '19123', '(215) 525-0175', '16', 'https://yardsbrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Philadelphia', '3705 ', 'W School House Ln', 'PA', '19129', '(215) 483-8833', '17', 'https://wissahickonbrew.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Philadelphia', '1727', 'N Front St', 'PA', '19122', '(215) 425-6820', '18', 'http://evilgeniusbeer.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Philadelphia', '2440', 'Frankford Ave', 'PA', '19125', '(215) 427-2739', '19', 'http://philadelphiabrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Philadelphia', '1023', 'Hamilton St', 'PA', '19123', '(215) 398-1900', '20', 'https://lovecitybrewing.com/')

INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Pittsburgh', '925', 'Main St', 'PA', '15215', '(412) 408-2083', '21', 'https://dancinggnomebeer.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Pittsburgh', '501', 'E Ohio St', 'PA', '15209', '(915) 209-5105', '22', 'http://www.strangerootsbeer.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Pittsburgh', '800', 'Vinial St', 'PA', '15212', '(412) 237-9400', '23', 'https://www.pennbrew.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Pittsburgh', '147', 'Julius St', 'PA', '15206', '(412) 537-2337', '24', 'https://www.eastendbrewing.com/')
INSERT INTO address (city_name, street_number, street_name, state, zip_code, phone_number, brewery, url) VALUES ('Pittsburgh', '3601', 'Butler St', 'PA', '15201', '(412) 904-2622', '25', 'https://burgherspgh.com/')




INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Lost Lager', 'Pilsner', '', '4.0', '1')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Mallow Laser Quest', 'IPA - Milkshake', '', '6.0', '1')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Hazy Jane Peach', 'IPA - New England', '', '7.7', '1')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Pineapple Punch', 'Cider', '', '4.0', '1')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Hard Drive', 'IPA - American', '', '8.0', '1')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('B-Corp', 'Pilsner', '', '5.0', '1')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Pride', 'Sour', '', '5.0', '1')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Hoppins All The Time', 'IPA - American', '"Hoppins all the Time" is a 6.8% West Coast IPA brewed with Citra Incognito and fermented with Berkeley Yeast Lab''s "Super Bloom" strain. This California ale yeast was genetically modified to produce terpenes (aroma compounds associated with hops and cannabis) and gives off a bouquet of lime and tangerine with notes of berry. We accentuated these aromas with a generous dry hopping of Amarillo, Citra and Simcoe hops.', '6.8', '1')

INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Truth', 'IPA - American', 'Intensely hopped, dry IPA with Centennial, Citra, Amarillo and Simcoe Hops. We hop this at a rate of 3lbs/bbl to rev up peach, mango and passion fruit notes.', '7.2', '75', '6');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Bubbles', 'Fruit Beer', 'A Rosé Ale made with apple, peach and cranberry, for additional pink hue, tartness and juicy fruitiness.', '6.2', '6');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Cougar', 'Blonde Ale', 'This bright blonde ale shines a brilliant malt character. Born of breezes, captured sunlight and whiffed, this beer is a balanced yet dry siren whose first sip calls for the third. Hopped with arguable restraint with Crystal and Bravo hops, Cougar stays fierce enough to raise eyebrows yet is tame enough to be called sessionable.', '4.8', '25', '6');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Dad', 'Red Ale', 'This hoppy Holiday Red Ale has a blend of hop spice, citrus and some caramel malts to raise the holiday spirit in this Pale Ale.', '6', '45', '6');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Peach Dodo', 'Sour', 'This German Gose is bright and frisky, tart and saline, and dances on the palate with punches of peach. Thirst quenching beyond all imagination. Peach Dodo is the finest of liquids for a beach picnic or for making history.', '4.4', '12', '6');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Franz', 'Märzen', 'Franz is our Oktoberfest beer. He’s an autumnal brew, a bit of a dreamer, often hikes in the Alps and comes back with great ideas for delicious malts and is forever hoisting barrels over his head for ’ze exercize’. Franz is our Oktoberfest brau, and our first take on a German brew. Not traditional, but über German. These malts will PUMP you UP, jaaah!', '5.4', '20', '6');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Knowledge', 'IPA - Imperial / Double', 'Intense & refined, Knowledge delivers notes of resinous pine, dank sap, pithy grapefruit, & ripe pineapple. Chewy hops, a zesty punch; this erudite Imperial India Pale Ale sharpens perceptive depths in the studious night.', '8.5', '98', '6');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Zen', 'IPA - Session', 'Zen is balance, the clear morning air, feeling the flow. Zen is purpose and determination and detachment. Not bitter, but hoppy and bright. This Session IPA emanates hints of orange zest and lemongrass.', '4.8', '45', '6');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Panther', 'Porter - American', 'This malty yet sneakily smooth Robust Porter simmers with tones of milk chocolate, carob and light molasses. Panther is a svelte creature of the night – a midnight malt whisperer.', '5.8', '28', '6');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Saber Tooth Tiger', 'IPA - Imperial / Double', 'Prehistorically hopped Imperial India Pale Ale that attacks the senses with potent notes of papaya, mango and peach - yet it finishes its prey (your palate) with a crisp clean citrus bitterness.', '8.5', '95', '6');

INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('PsycHOPathy', 'IPA - American', 'Explore the blend of citrus, bright, and floral aromas. Additional citrus flavors follow alongside a smooth bitterness. It finishes with a medium body and a slightly sweet, malty backbone. Trust your senses.', '6.9', '60', '7');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Lift', 'Kölsch', 'Whether taking a break from a hard day of work or just a huge day of hops, this crisp, refreshing beer with a hint of orange will lift your spirits without lowering your expectations for what a craft beer should be.', '4.7', '11', '7');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Happy Amber', 'Red Ale - American Amber / Red', '2018 GABF Gold Medal Winner | This dry-hopped ale combines caramel and biscuit malt flavors in happy equilibrium with late addition American hops. The approachable balance is intentional although the name is a “hoppy” accident.', '6', '30', '7');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Thundersnow', 'Scottish Ale', 'The conditions have to be just right for the formation of Thundersnow. Ginger, nutmeg and vanilla, hints of cinnamon and a bready malt sweetness create a storm of flavors. When you find this rare occurrence, savor it as long as you can.', '8.5', '18', '7');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Shade', 'Fruit Beer', 'If a shortcut through the woods beats the heat, why not take it? Though non-traditional, Shade’s blackberries and sea salt quench thirst amidst any sunny day. Feel free to kick back and relax, the ‘Tree has you covered.', '4.6', '10', '7');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Rubus Cacao', 'Stout', 'Sweet chocolate notes lead as raspberry tartness follows in unison resembling a perfectly executed dance. The result is a blend of flavors even more spectacular together than apart. It''s love at first sip.', '7', '12', '7');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('PSA', 'Pale Ale - American', 'PSA was designed to be just that, a Public Service Announcement that craft beer can be both thoughtful and approachable. You may choose to dissect the abundance of citrus, dank, and tropical fruit flavors or to simply enjoy the proper balance between malt sweetness and body that PSA delivers. Either way, you bring the friends. We''ll bring the beer. Spread the word.', '4.5', '30', '7');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Citra High', 'IPA - Imperial / Double', 'Senses reshape as an explosion of American hops bring a kaleidoscope of tropical and citrus flavors.', '9.5', '120', '7');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Galaxy High', 'IPA - Imperial / Double', 'Join two Australian hops as you encounter a crazy collection of tropical and dank flavors throughout this Imperial IPA. It’s big on your palate… disruptive even. Think "trophic cascades" disruptive.', '9.5', '120', '7');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Rounding Third', 'IPA - Red', 'Brewed to celebrate the start of our favorite pastime. Rounding Third has a slight caramel semisweet malt backbone balanced by a strong hop profile. Dry hopped with Falconers Flight and Simcoe that will have your palate rounding third and heading for home.', '6.5', '51', '7');

INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Scoring Discrepancies', 'Brown Ale - Imperial / Double', 'Imperial Stout with peanut butter and raspberry. In collaboration with Bottle Logic Brewing.', '11.6', '8');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Nutcase Peanut Butter Porter', 'Porter - American', 'A nice smooth porter with a back end of peanut butter happiness.', '6.8', '33', '8');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Wisconsin Stout', 'Stout - Imperial / Double', 'Strong stout with maple and lactose. Collaboration with Untitled Art.', '10', '8');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Team Fiona', 'IPA - New England', 'Fiona is a surprise dream team collaboration between us and the Cincinnati Zoo''s rising star, Fiona the Hippo! We are humbled and honored to be a part of the team that is supporting this adorable little hippo. We made the beer to appeal to a wide audience, not just the hardcore beer geeks, so we went with the tried and true combination of Citra and Centennial. The result is a very pleasant, quaffable tropical and citrus forward IPA with little to no bitterness, that should slake the thirst of both someone new to craft beer, as well as the veteran craft aficionado. Either way, we are proud to be a partner in support of Fiona and the Cincinnati Zoo, and we hope that people enjoy the beer!', '7.2', '8');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Shamrock Shake', 'Stout - Milk / Sweet', 'Irish Cream Stout. **Please note there is no mint in this beer**', '5.5', '25', '8');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Don''t Talk Sh!t About Norwood', 'Pale Ale - American', 'Session Pale ale with all Falconer''s Flight 7 C''s hops. Just Don''t Talk Sh*t about Norwood!', '4.2', '31', '8');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Yoda Potato Strikes Back', 'IPA - Imperial / Double', 'NE IIPA w/ Citra, Lemondrop and Galaxy.', '8', '8');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Hank the Dumpster Kitty', 'IPA - Imperial / Double', 'New England Style IIPA brewed in honor of our brewer John''s cat. Hank was a stray cat that hung out by  Hops: Apollo, Mosaic & Citra Lupulin Powder, Citra & El Dorado Resin, Citra & Mosaic & El Dorado pelletthe dumpsters outside the brewery that he rescued, hence the name.', '8.1', '8');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('The Works', 'Stout - Milk / Sweet', 'Sweet Stout brewed with chocolate, peanut butter, vanilla, powdered sugar, nuts and sprinkles. Brewed for National Pretzel Day (April 26th) which is the best day of the year. This is pretzel day!', '10.5', '8');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Satisfied?', 'Stout - Milk / Sweet', 'Stout brewed with chocolate, caramel and peanuts to satisfy your beer thirst.', '7', '8');

INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('The Gadget', 'Sour - Fruited', 'A Midwest Fruit Tart Ale with 1,280 lbs of blackberries, 1,280 lbs of raspberries & 30 g of vanilla beans per 30 BBL batch.', '8', '25', '9');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Keypunch', 'Sour - Fruited Gose', 'Our house Gose with key lime zest and key lime juice added to give it a tropical punch and a refreshing kick for an all around great summer beer! Only whole keylimes were used making this beer giving a bright citrusy kick to our most refreshing summer brew.', '4.3', '12', '9');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Finn', 'IPA - Sour', 'A Tart Pale Ale, which is hopped like a citrusy American Pale Ale wit a crisp tartness. Citrus & apricot hop flavors lead the charge.', '5.3', '36', '9');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Pinwheel', 'Sour - Fruited Gose', 'Gose brewed with 500 lbs of oranges, 22 lbs of sea salt, 1 lb of coriander & 30 g of vanilla beans per 30 BBL batch.', '4.5', '12', '9');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Operation Plowshare', 'Fruit Beer', 'A Midwest Fruit Tart brewed with 2,600 lbs of blackberries & 90 g of vanilla beans per 30 BBL batch.', '8', '15', '9');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Sliderule', 'Sour - Fruited Gose', 'A dark gose with 800lbs of raspberries and 7.5 gallons of liquid cacao per 30bbl batch.', '4.9', '12', '9');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Squeezebox', 'Fruit Beer', 'Strawberry Midwest Fruit Tart. Brewed with over 3,000 lbs of strawberries per 30bbl batch.', '8.6', '9');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Fire Iron', 'Fruit Beer', 'This Midwest Fruit Tart Ale is brewed with 1,500 lbs of pink guava, 500 lbs of banana, and 400 lbs of passion fruit per 30 bbl batch.', '7.7', '20', '9');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Pickle', 'Sour - Fruited Gose', 'Pickle Pickle Pickle. 1000 lbs of fresh cucumber and two pounds of fresh dill weed. Pickle Pickle Pickle.', '4.3', '11', '9');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Spyglass', 'Sour - Gruited Berliner Weisse', 'Featuring 250lbs of Lemon Peel and 200lbs of Lime Peel, this beer is balanced, light, and easy-drinking.', '4.7', '15', '9');

INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Tollhouse', 'Stout - American', 'Black color with moderate bitterness. Strong roasted coffee flavor and aroma with hints of chocolate.', '7.9', '49', '10');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Earth Daisy', 'IPA - Imperial / Double', 'Reddish amber color with high bitterness. Rich malt flavor with hints of caramel and a slight peppery finish. The sweet malt backbone balances the intense earthy, piney hops.', '8.9', '121', '10');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Hoy Tripel', 'Belgian Tripel', 'Bright gold color with little bitterness. A big, dense, creamy head with a full mouthfeel. Slightly fruity with a sweet finish.', '8.9', '26', '10');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Oberhausen', 'Kölsch', 'Very pale color with medium bitterness. Somewhat vinous (grape-like) with a dry finish.', '5.6', '20', '10');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Marty''s Hamilton Ave IPA', 'IPA - American', 'Orangish gold color with minimal bitterness for an IPA, but tons of aroma and flavor to complement the rich malt backbone. Six varieties of hops give this beer its bold fresh citrus and tropical fruit aroma and flavor. Hints of black pepper linger in the aftertaste.', '6', '49', '10');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('The Noid', 'Red Ale - Irish', 'Irish red with honey.', '5.6', '28', '10');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Prunus', 'Stout - Milk / Sweet', 'Milk Stout w/ Cherries. Sweet stout w/ sweet and sour cherries.', '6.6', '16', '10');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Pepo Acer', 'Pumpkin / Yam Beer', 'Pumpkin Porter w/ Maple Bacon Donuts.', '6', '29', '10');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('HuLu', 'IPA - American', 'Pale yellow color, dominated by fresh hops in all phases … bitterness (earthy and citrusy especially grapefruit), flavor and aroma (spicy and citrusy with hints of pine). There is no malt backbone to this. It is a true homage to the hop!', '5.4', '89', '10');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Pepo', 'Pumpkin / Yam Beer', 'Pumpkin Porter.', '6', '29', '10');

INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Speed Merchant', 'IPA - White', 'White IPA with fruity, tropical dry hops. White wheat gives a very pale color.', '6.6', '66', '11');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Haze Jude', 'IPA - New England', 'Brewed with Simcoe and Michigan Chinook, this haze-filled wonder is a pineapple bomb that drinks smooth and is citrus Juicy.', '6', '46', '11');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('New Cleveland Palesner', 'Pilsner', 'This Pilsner/Pale Ale Hybrid is a clear straw color with a crisp German malt body and refreshing Noble hop finish with floral and herbal aromas.', '5', '23', '11');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Caramelicious', 'Stout - Milk / Sweet', 'Brewed with our friends with the unmistakable pink silos, Malley’s Chocolates. This salted caramel chocolate milk stout incorporates Malley’s famed salted caramel that lends a luscious, silky smooth body and will satisfy even the most child-like sweet tooth. Overtones of vanilla, chocolate, and caramel give way to a rich and heavy body with enough warmth to keep you cozy through this interminable winter.', '7.1', '21', '11');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Yammy Yammy', 'Pumpkin / Yam Beer', 'We know the smell of fall in the air, sweet, delicious roasted yams. Flavors amplified by seasonal and complimentary spices like cinnamon, nutmeg, and clove. This ale will have you lounging by the fireside in no time.', '7.7', '16', '11');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Holiday Donut Cookie', 'Spiced / Herbed Beer', 'Say hello to our new Holiday Ale brewed with our friends at Brewnuts CLE. Sweet milk sugar, vanilla, spice, and homemade snickerdoodle cookies. Cheers to spreading more cheer!', '7', '24', '11');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Orange Blossom Gose', 'Sour - Fruited Gose', 'Gose-style sour brewed with artisanal sea salt and orange zest to be a thirst-quenching, sessionable warm weather beer.', '4.2', '9', '11');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Paranormal Hoptivity', 'IPA - American', 'A reverent imagination of the American IPA. Pale orange in color with a ghastly addition of Ekuanot and MI Cascade hops. Mild bread and caramel malt character are accompanied by big bright citrus, tropical fruit, and melon. Dank hops.', '7', '57', '11');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Red Martian', 'Sour - Fruited', 'This slushee style sour pays homage to an old summer staple with our own twists. Fermented with Raspberry, Pineapple, and Orange this thick and smooth sour hits all the fruit notes. Additions of lactose and vanilla give hints of sweetness to round out this refreshing brew.', '5.6', '8', '11');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Esther', 'Belgian Strong Dark Ale', 'This Belgian-style Christmas Ale brings flavors of honey, dark cherries, and a hint of toffee as the glass warms.', '9.5', '23', '11');

INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Namber Ale', 'Red Ale - American Amber / Red', 'N/A', '5.5', '12');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('The Gustavo Black IPA', 'IPA - Black / Cascadian Dark Ale', 'This brew combines 5 malts and 5 hops to make a complex yet drinkable brew.', '7.2', '12');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Tandem Cruiser', 'Shandy / Radler', 'A blend of pale lager and sparking lemonade.', '3.8', '12');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('#Kolsh', 'Kölsch', 'N/A', '5.5', '12');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('El Dorado', 'IPA - American', 'N/A', '6.7', '12');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Harvest Wheat', 'Wheat Beer / American Pale Wheat', 'N/A', '6.5', '12');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Particle Accelerator Double IPA', 'IPA - Imperial / Double', 'N/A', '10', '100', '12');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Jamican Chris Stout', 'Stout - American', 'N/A', '7', '12');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Fireside Wheat Winter Hefeweizen', 'Hefeweizen', 'N/A', '8', '12');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Windy And Wild', 'Farmhouse Ale - Saison', 'N/A', '5.7', '12');

INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Christmas Ale', 'Winter Ale', 'Do not open ‘til Christmas? Whoever coined that phrase obviously hasn’t tasted Christmas Ale’s fresh honey, cinnamon, and ginger flavors.', '7.5', '30', '13');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Edmund Fitzgerald', 'Porter - American', 'Robust and complex, our Porter is a bittersweet tribute to the legendary freighter’s fallen crew—taken too soon when the gales of November came early.', '6', '37', '13');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Chillwave Double IPA', 'IPA - Imperial / Double', 'Inspired by the North Coast''s dedicated (and sometimes chilly) surf community, our fully stoked Double IPA will melt the ice in your beard and never lose its balance.', '9', '80', '13');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Dortmunder Gold', 'Lager - Dortmunder / Export', 'A classic award-winning balance of sweet malt and dry hop flavors, proudly waving the flag for Cleveland and refreshing beer drinkers everywhere since 1988.', '5.8', '30', '13');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Oktoberfest', 'Märzen', 'Prost! Our take on this classic German style is a real malt party, packed with toasty autumnal flavors perfect for hearty hoisting.', '6.5', '20', '13');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Eliot Ness', 'Lager - American Amber / Red', 'Admittedly, it’s a bit of a paradox to name our Amber Lager for history’s most famous agent of prohibition. But it’s a smooth, malty (and dare we say, arresting?) paradox.', '6.1', '27', '13');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Commodore Perry IPA', 'IPA - English', 'What’s this? A British-style IPA named after the man who defeated His Majesty’s Royal Navy in the War of 1812? Consider this a bold, hoppy (and mildly ironic) plunder of war.', '7.7', '70', '13');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Burning River Pale Ale', 'Pale Ale - American', 'Greetings from Cleveland! Where an infamous river fire rekindled appreciation for our region’s natural resources (like the malt and hops illuminating this Pale Ale).', '6', '45', '13');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Conway''s Irish Ale', 'Red Ale - Irish', 'A pint for Pa Conway! Our co-owners’ grandfather and policeman who’d likely uphold that an Irish Ale with full-bodied caramel malt flavors is just the ticket.', '6.3', '25', '13');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Lake Erie Monster', 'IPA - Imperial / Double', 'Issue a small craft advisory: this South Bay Bessie-inspired brew unleashes a beastly hop attack amid torrid tropical fruit flavors.', '9.5', '80', '13');

INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('IPA', 'IPA - American', 'This IPA is the culmination of hundreds of recipe iterations over the last six years. You’ll be met upfront with aromas of grapefruit and passionfruit, accompanied by a smooth mouthfeel, soft bitterness, and tropical fruit flavors.', '6.8', '70', '14');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Single Origin Coffee Stout (Ethiopian Yirgacheffe)', 'Stout - Coffee', 'We partnered with our friends at Six Shooter Coffee to bring you this mash-up of our two favorite beverages. The lightly roasted Ethiopian Yirgacheffe coffee beans used in this beer bring flavors and aromas of berry and cocoa that pair perfectly with the roasty notes from the stout.', '6.9', '30', '14');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Tire Swing', 'Pale Ale - New England', 'This hazy pale ale is perfect for spring. Bursting with notes of citrus and stone fruit, this beer has just enough bitterness, hop flavor and aroma to keep it quaffable.', '5.5', '14');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Falling Fruit', 'Fruit Beer', 'We set out to create a beer that showcases two of our favorite fruits: tart apples and sweet peaches. We fermented it on the fruit with one of our favorite yeasts to give it a juicy character, pleasant body, and just enough sweetness to evoke memories of biting into a fresh peach or apple.', '5.8', '20', '14');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Extra! Extra!', 'IPA - Imperial / Double New England', 'Hot off the press is Extra! Extra!, one of our favorite Double New England IPAs. This beer was double dry hopped with some of our favorite American hop varieties to push the flavor and aroma over the top.', '8', '14');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Sleigh All Day IPA with Spruce Tips', 'IPA - Red', 'This seasonal IPA was brewed with a blend of spruce tips and hops yielding a balance between tropical hop goodness, piney dankness, and a brilliant malt backbone that complements all of our favorite parts of the holidays. Enjoy this beer with your loved ones while roasting chestnuts over an open fire, listening to your uncle''s best dad jokes, or to simply celebrate the season.', '7.5', '14');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Haunted Hayride Pumpkin Ale', 'Pumpkin / Yam Beer', 'Our house pumpkin ale is brewed with pumpkin, cinnamon, nutmeg and ginger.', '7.3', '14');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Flat Earth Double NEIPA', 'IPA - Imperial / Double New England', 'We threw brewing science to the curb with this beer and added an unbelievably stupid amount of hops at every step of the process. Logic and reason need not apply. Just stop reading this, believe us that it''s good, and drink it already.', '8', '14');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('A Series of Tubes', 'IPA - New England', 'A hazy, soft, and juicy IPA carefully crafted to showcase the tropical notes of these specially-processed hops. We hope you enjoy it with good company and remember, a brewery is really just a series of tubes.', '6.7', '35', '14');
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Paper Boy', 'IPA - New England', 't''s Saturday and you''re standing on the porch waiting for your newspaper. As the Paper Boy rides by, you expect the news, but instead you find yourself getting smacked in the face with your favorite American hops. This beer is the culmination of what we have learned brewing New England Style IPA.', '7.3', '14');

INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Evil Motives IPA', 'IPA - American', 'Double dry-hopped IPA, brewed with big hop additions of Citra, Simcoe, and Mosaic. Smooth bitterness, big aroma, and a clean finish.', '7.2', '68', '15');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Kapitän Alt Bier', 'Altbier', 'Altbier is a copper colored German-style ale with a moderate hop character. A traditional decoction mash brings out rich malt flavors without sweetness and makes Kapitän an easy drinker. A favorite of the Brewmaster!', '4.7', '38', '15');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Catchweight Kolsch', 'Kölsch', 'A light German-style ale. Want a Bud Light? Too bad. you can have this and it won''t suck. Crisp, dry, and smooth.', '4.5', '20', '15');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Union Pils Bohemian Lager', 'Pilsner - Czech', 'Traditionally brewed with a double-decoction mash to enhance malt flavor and balanced with Czech Saaz hops for a delightfully floral and spicy aroma. Lagered horizontally for two months for clarity of flavor.', '4.9', '37', '15');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Murder Ballads', 'Porter - Baltic', 'A cold lager fermentation sets this porter apart from its English and American brethren. An amazingly complex dark malt character produces layers of milk chocolate, cherries, plums, and toffee. Full bodied with a touch of sweetness up front, Murder Ballads finishes with a dry coffee roast. 2019 Bronze & 2020 Silver GABF Medal Winner.', '8', '41', '15');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Dearly Departed', 'IPA - Black / Cascadian Dark Ale', 'Cascadian Dark Ales, or Black IPAs, were first brewed in the Pacific Northwest. Ours features Oregon-grown Simcoe hops and dark malts that were steeped in cold water to extract color and a rich dark chocolate character with less roasty bitterness. Simcoe dry hops impart piney and grapefruit aromas backed up by rich malt character and a firm bitterness.', '5.6', '45', '15');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Imperial Cookies And Milk Stout', 'Stout - Russian Imperial', 'Inspired by our Kitchen Sink Cookie, this easy drinking Russian Imp. Stout is brewed with cacao nibs from The Cleveland Chocolate Co., vanilla beans, and oats. Garnish with a mini cookie for $1.', '10.1', '60', '15');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Sweet Potato Saison', 'Farmhouse Ale - Saison', 'Our kitchen roasted more than 150lbs. of sweet potatoes from CWRU''s farm for this fall seasonal. A light touch of cinnamon, fresh ginger, nutmeg, and allspice complement the Belgian saison yeast and the sweet potatoes impart a glowing orange hue.', '7.7', '25', '15');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Sour Raspberry Grisette', 'Grisette', 'Big raspberry aromas greet you in this sessionable Belgian-style saison. The fruit''s sweetness quickly fades to a sour bite from a lactobacillus and brewer''s yeast co-fermentation. Belgian yeast character intermingles with the fruits complexity to create an easy day drinker.', '4.1', '12', '15');
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Say When Saison', 'Farmhouse Ale - Saison', 'Belgian style saison brewed with black peppercorns in the boil and fermented with pink and green peppercorns. Complex aroma with a pleasant peppery finish.', '6.9', '26', '15');

INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Philthy', 'Hazy IPA', 'A new unfiltered Hazy IPA. People in Philly don’t have a filter, and neither does our Philthy Hazy IPA. This bold, aromatic ale is loaded with tropical and citrus hops character and has that classic hazy, golden color. And just like the city where it’s brewed, this unapologetic IPA is left unfiltered.', '6.5', '30', '16')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Philadelphia Pale Ale', 'Pale Ale', 'Not to be boastful, but we believe that all other ales pale in comparison to this Philadelphia favorite. Dry-hopped with an abundance of distinctive Simcoe hops, this straw-colored pale ale is more drinkable than bitter, more aromatic than aggressive.', '4.6', '37', '16')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Philly Standard', 'Beer', 'Work Hard, Drink Easy. Sometimes you just want a beer. No bells. No whistles. Just a good, handcrafted, no-nonsense beer that works just as hard as you do. Light. Clean. Easy. The standard beer for every occasion.', '4.5', '10', '16')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Our Signature IPA', 'American IPA', 'Our Signature IPA is loaded through and through with assertive American hops. Traditional floor-malted English barley gives IPA its firm malt character while generous amounts of Chinook and Amarillo hops impart aromas of pine and tangerine for a perfectly balanced IPA.', '7.0', '62', '16')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Brawler', 'English Mild', 'Crafted in the style of an English mild, this malt-forward ale is great when you want to go a few rounds. Its smooth character, hints of caramel and toast and remarkable drinkability define this ruby-colored brew as a knockout session ale.', '4.2', '12', '16')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Loyal Lager', 'American Craft Lager', 'Philly''s hometown Lager. 25 years after opening our first garage brewery in Manayunk, we’ve built our dream brewery in the heart of the city – all thanks to our fans who have been loyal since the beginning. As a sign of our gratitude, we’ve used our new world-class brewing system to create Loyal Lager: a crisp, easy-drinking American Craft Lager brewed with two-row malt and aromatic Loral hops. It’s what a clean, high-quality lager is meant to be.', '5.0', '5', '16')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Featherweight', 'Hazy Pale Ale', 'Just because it’s light, doesn’t mean it isn’t good in a fight. Put up your dukes and enjoy this light-bodied, low bitterness hazy pale ale with tangerine and citrus hops. And, coming in at only 105 calories, this is the perfect easy-drinker for any weight class.', '3.7', '20', '16')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Pynk', 'Fruit Beer', 'Each sip of PYNK starts with a crisp, fruity zing and finishes refreshingly dry. The delightful pink hue comes from heaps of fresh raspberries and cherries in every batch. It’s no wonder PYNK is called the rosé of beer. So let’s raise our bottles and pints to the good things in life — like family, friends, and beer — that bring us all together.', '5.5', '6', '16')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Love Stout', 'Nitro Stout', 'Our brewers have poured their hearts and roasted malts into this rich, well-rounded stout. Luscious notes of coffee and chocolate accent Love Stout''s smooth, creamy mouth feel. We will not apologize for any amorous affairs resulting from the consumption of this beverage!', '5.5', '33', '16')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Extra Special Ale', 'English Ale', 'Our first-ever and most-beloved brew, ESA helped establish a following for cask-conditioned beer in the United States back in the ‘90s. East Kent Golding hops give this British-inspired ale a subtle spiciness, which complements the strong malt backbone. ESA is floral, earthy and smooth with hints of chocolate and caramel, rounding out this deep chestnut-colored ale.', '6.0', '47', '16')

INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Hopshaug', 'NE Double IPA', 'New England style double IPA dry hopped w/ Sultana & Amarillo.', '8.4', '46', '17')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Liquid Hips', 'Hazy IPA', 'Hazy IPA double dry hopped with Galaxy, Waimea & Cashmere delivering a tongue drenching bouquet of orange creamsicle, strawberry, lemongrass, & peach sorbet.', '7.1', '24', '17')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Frux: Raspberry Lemonade', 'Fruited Sour', 'Fruited Sour Ale w/ Raspberry & Lemon Purée. Contains lactose.', '7', '8', '17')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Pink Pineapple Wit', 'Witbier', 'Hundreds of pounds of juicy pineapple, pink guava, & a dash of coriander create this incredibly flavorful, refreshing witbier.', '5.5', '10', '17')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Calumet', 'Saison', 'French saison spiced w/ rainbow peppercorn & coriander. Lightly hopped w/ Lemondrop. Dry w/ a farmhouse funk.', '6.2', '34', '17')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Crumble', 'Oreo Porter', 'A luscious, velvety porter conditioned on 50lbs of Oreo, liquified cacao, & Madagascar bourbon vanilla beans.', '6.2', '36', '17')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Tangerine IPA', 'NE IPA', 'Brewed w/ a massive heap of wheat & flaked oats, then fermented on a fruit-forward, juicy NE yeast strain. Hopped w/ Simcoe & Centennial at nearly 3lbs/BBL, then blended w/ nearly 200lbs of juicy tangerine for an exceptionally juicy, citrusy finish.', '6.9', '44', '17')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Wigman Simcoe', 'NE Pale Ale', 'Our beloved Wigwam double dry hopped w/ Simcoe. Heavy notes of dank pine & mango.', '5.0', '33', '17')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Black Bear', 'IPA', 'Named after our infamous East Falls black bear & brewed to his liking with 60lbs of wildflower honey. Dry hopped with Amarillo for a citrusy finish.', '6.0', '73', '17')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Buzzz''d', 'Wildflower Honey IPA', 'Brewed w/ flaked oats & 60lbs of Wildflower Honey from Fruitwood Orchards in Monroeville, NJ. Kettle & dry hopped w/ Idaho 7. Notes of blueberry, pineapple, & orange zest. Smooth, refreshing, & a bit sweet.', '7.5', '26', '17')

INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('There''s No Crying In Baseball', 'Hazy Mango IPA', 'A hazy IPA with natural mango flavor and a wicked curveball. Light, hazy, and refreshing, this beer is packed with flavor from hefty dry-hopping and natural mango. You could say it’s in a league of its own.', '6.0', '42', '18')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Purple Monkey Dishwasher', 'Chocolate Peanutbutter Porter', 'If candy and beer had a beautiful liquid baby. Do you like chocolate and peanut butter but hate all that pesky chewing? Give your teeth a vacation with our rich, full-bodied chocolate peanut butter porter.', '6.7', '35', '18')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Stacey''s Mom', 'Citra IPA', 'You’re in love with this beer. One of our year-round flagship beers, Stacy’s Mom is an IPA with low bitterness and lots of hop flavor. It’s dry-hopped entirely with Citra, which, as you may have guessed, gets its name from its strong citrus notes. (You’re so smart!)', '7.5', '85', '18')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('#Adulting', 'Guava IPA', 'A guava IPA that paid its rent on time. Adulting is hard. Finding a delicious IPA should not be. Well, look no further. This smooth IPA is infused with all-natural guava flavor, making it the perfect reward for remembering to turn the oven off.', '6.8', '45', '18')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('I''ll Have What She''s Having', 'Chocolate Hazelnut Imperial Stout', 'This Chocolate Hazelnut Imperial Stout is so rich and decadent, you’ll want to spread it on toast. Our winter seasonal Imperial Stout is infused with natural chocolate and hazelnut flavors. Rich, dark, and full-bodied without being sticky-sweet, this beer is smooth. Like, so smooth. Rob-Thomas-and-Carlos-Santana-on-an-ice-luge smooth.', '9.4', '87', '18')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('I Love Lamp', 'Pineapple Hefeweizen', 'A German wheat beer with a Hawaiian twist. This refreshing German Hefeweizen got taken on a tropical vacation with the addition of natural pineapple flavor. Does this go against the German beer purity law? Yep. Is that the way we like it? Also yep.', '5.5', '12', '18')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Trick Or Treat', 'Chocolate Pumpkin Porter', 'Hey! This beer is haunted! Don’t drink it! Yes, I know it’s a dark, roasty porter with cinnamon, clove, nutmeg, and chocolate, and it tastes amazing, but don’t drink it! It’s! Haunted! Fine. But don’t run to me when the walls of your fridge start bleeding.', '7.8', '35', '18')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('New Phone Who Dis?', 'Caramel Macchiato Porter', 'A caramel-coffee kick in the crotch. Dark and toasty, rich and roasty. Our winter seasonal porter is brewed with dark, sweet malt and infused with natural caramel flavoring and locally roasted Saxby’s coffee. Your favorite espresso beverage is now your favorite adult beverage.', '6', '8', '18')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('#ICan''tEven', 'Watermelon Blonde Ale', 'Like eating a watermelon without all the slicing. Do you want to drink beer and eat watermelon but only want to use one hand? Then this blonde ale infused with natural watermelon flavor is the one for you. And it won’t get your mitts all sticky.', '5.6', '9', '18')
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('You''re Killing Me, Smalls!', 'Rasberry Shandy', 'A blonde ale with raspberry, lemon, and attitude. Welcome to our warm-weather crusher. This light, refreshing blonde ale has been infused with natural raspberry and lemon flavors, making it the perfect beverage for stickball season.', '5.5', '14', '18')

INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Black Cat Lager', 'Black Lager', 'Black Cat Lager is brewed in honor of Nero, one of our resident working cats. This Double Dry Hopped Black Lager is as delicious as black cats are adorable. Cheers to you Nero!', '5.0', '19')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Kenzinger', 'Beer', 'This crisp, light-bodied, golden beer is the very definition of refreshment. The combination of premium German pilsner malts and American Noble hops aims to please your taste buds and satisfy your thirst.', '4.5', '19')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Youth in Asia', 'Imperial IPA', 'An Imperial IPA brewed with rice and sorachi ace hops.', '8.5', '19')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Electro Lyte', 'Pale Ale', 'A very sessionable, full-bodied Pale Ale with a low ABV (3.9%), brewed with apricots, white and pink grapefruit, a touch of Himalayan pink salt and rye malts. It has a very generous amount of aroma hops including Chinook and Nugget. This beer contains more electrolytes than your average brew (namely sodium and potassium) due to the addition of apricots, grapefruits and pink salt which naturally contain a high amount of these minerals. It is the ideal beer to recover from a run with.', '3.9', '19')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Walt Wit', 'White ALe', 'The American poet, Walt Whitman, once portrayed a sunset over Philadelphia as “…a broad tumble of clouds, with much golden haze and profusion of beaming shaft and dazzle”. Pour yourself a bottle of Walt Wit Belgian-Style White Ale and see what he was talking about. A pinch of spice and a whisper of citrus lend complexity to this fragrant and satisfying ale.', '4.5', '19')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Working Cat Pale Ale', 'Pale Ale', 'Working Cat is an ode to Duke, our very own working brewery cat. It is a double dry hopped pale ale brewed with Amarillo and Falconer’s Flight hops, as well as grapefruit and orange peels, which gives the 5% session-able beer balanced citrus notes with minimal bitterness. This newly-released brew is smooth, citrusy and light bodied, and is packed full of aroma.', '5.0', '19')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('PHL Session IPA', 'IPA', 'Philadelphia’s hoppy and light session IPA. PHL has all of the hop aroma and flavor that you would expect from an IPA with the alcohol content of a light beer.', '3.9', '19')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Schwarzinger', 'Black Lager', 'A German style black lager brewed with premium pilsner and dark roasted malts.', '5.0', '19')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Shackamaximum', 'Imperial Stout', 'In 1682 William Penn signed a treaty with the Native American leaders of the Shackamaxon village, which later became the district of Kensington, where our brewery is located today. This is a rich, dark brew made with chocolate and Munich malts and aged on French oak. We hope you enjoy sipping on this full bodied imperial stout.', '8.0', '19')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Kilty Pleasure', 'Scotch Ale', 'Kilty Pleasure Scotch Ale exhibits a subtle aroma of vanilla and boasts a rich six-malt body tempered by heather and hops.', '10.0', '19')

INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Love City Lager', 'American Golden Lager', 'Love City Lager is brewed for everybody. Our American Golden Lager is simple, clean, and true to its roots. Lightly malty and a hint of orange aromatics give every bright sip a clean landing.', '4.0', '20')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Lime City Lager', 'Lime-Infused Lager', 'That feeling you get when surrounded by good friends & sunshine – in a can! Made with lime and sea salt for a bright, refreshing taste. The perfect beer for warm weather & good times.', '4.0', '20')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Zen Arcade', 'Summer Ale', 'Fermented with Kviek yeast, this refreshing beer is bursting with lemon & berry aroma & flavor. European hops balanced by light bready malt character make this a well-balanced session ale. ', '4.8', '20')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Deep Cut', 'Pilsner', 'Pilsner is the beer that brewers reach for. Like a musician’s favorite track, it’s a Deep Cut. This one is made with all German malt and hops. Lightly bready malt character with floral and herbal hop notes. It’s crisp, complex & crushable.', '5.0', '20')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Sylvie', 'Oatmeal Stout', 'This English-style oatmeal stout is silky smooth and lightly sweet. This year-round stout s brewed with dark, roasted malts then lend rich dark chocolate and espresso flavors. The addition of oats lends a smooth, round finish.', '5.0', '20')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Unity', 'American IPA', 'This approachable IPA brings hop lovers together around the citrus flavors of our hop blend. It is assertive, yet highly drinkable. Low bitterness and a crisp finish.', '5.5', '20')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Eraserhood', 'Hazy IPA', 'Our signature hazy IPA is a love letter to our neighborhood, the Eraserhood. Off-beat and vibrant, this IPA is triple dryhopped. Huge flavors of mango and pineapple with a smooth, round body. Moderate malt backbone and juicy finish.', '7.2', '20')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Periphery', 'Wild Ale', 'A lightly tangy wheat beer, 100% barrel fermented with French Saison yeast & a blend of Brettanomyces yeasts. Dry & bright with a pleasant tartness, this beer has complex notes of lemon rind, oak, & mild green peppercorn.', '6.0', '20')

INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Better One Or Two', 'Double IPA', 'The original ophthalmic DIPA and first in our arsenal, B12 drips with an ever present cohesion of Citra, Mosaic, and Simcoe that resonate the bold notes of grapefruit, tangerine spritz, ripe red berry, and sticky sap.', '8.0', '21')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Astroid', 'West Coast IPA', 'This West Coast style IPA stands firm alongside it’s hazy core brethren. Thoughtfully hopped with Sultana, Citra, and Chinook, you can expect huge aromas of candied pineapple and orange, with flavor that follows suit alongside sticky pine sap and a clean bitterness on the back end.', '7.2', '21')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Jam', 'IPA', 'Jam is the solo show of hops at center stage. Each variant is dry hopped exclusively with a single variety, allowing that hop to shine and shred. The original Jam features Vic Secret, with Citra, Mosaic, Simcoe, Galaxy, and Nelson rotating through.', '6.8', '21')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Lustra', 'American Pale Ale', 'The one that started DG. Our favorite beer and soon to be yours. This perfect pale ale is super soft and dripping with the sweet nectar of sticky oils from Citra and Amarillo hops, for pungent notes of pink grapefruit, sweet tangerine, and blossoming bouquet.', '5.8', '21')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Prologue', 'American Pale Ale', 'This classic American Pale Ale is thoughtfully hopped with Simcoe, Centennial, Amarillo, and Columbus for bright hints of lime, tangerine, spring blossoms, sticky pine and a firm but very approachable bitterness to round it all out.', '5.8', '21')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Etch', 'IPA', 'Part of our original trio of lupulin cryo beers alongside Pounch and Flock, Etch is hopped with Citra Cryo and Enigma hops for a unique and delicious experience that I can only liken to that of a white shark bite.', '6.6', '21')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Marbled Hearts', 'American Cream Ale', 'A beautiful classic with bright notes of marmalade, grapefruit, and honeysuckle.', '4.5', '21')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Upward Below', 'Petite IPA', 'A petite IPA ideal for anytime at 4% and loaded with Citra and Mosaic hops for layers of pungent grapefruit and sticky sweet berries.', '4.0', '21')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Tentacle Squad', 'IPA', 'A torrent of blended tropical aroma with punches of mango, raspberry, key lime, tangerine, and purple skittle all baked lovingly into grandma’s pie crust recipe.', '7.0', '21')
INSERT INTO beers (name, style, description, ABV, brewery) VALUES('Aevum', 'Petite IPA', 'Small but mighty, Ella and Enigma hops are on full display in this easy drinking but potent Petite IPA. ABV dialed back, hop suration turned to 11. Just the way we like it.', '4.2', '21')


SELECT * FROM breweries

SELECT * FROM address

SELECT * FROM beers

GO