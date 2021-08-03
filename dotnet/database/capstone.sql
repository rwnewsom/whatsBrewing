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

INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Philthy', 'Hazy IPA', 'A new unfiltered Hazy IPA. People in Philly don’t have a filter, and neither does our Philthy Hazy IPA. This bold, aromatic ale is loaded with tropical and citrus hops character and has that classic hazy, golden color. And just like the city where it’s brewed, this unapologetic IPA is left unfiltered.', '6.5', '30', '16')
INSERT INTO beers (name, style, ABV, IBU, brewery) VALUES('Philadelphia Pale Ale', 'Pale Ale', 'Not to be boastful, but we believe that all other ales pale in comparison to this Philadelphia favorite. Dry-hopped with an abundance of distinctive Simcoe hops, this straw-colored pale ale is more drinkable than bitter, more aromatic than aggressive.', '4.6', '37', '16')
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
INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Pink Pineapple Wit', 'Witbier', 'Hundreds of pounds of juicy pineapple, pink guava, & a dash of coriander create this incredibly flavorful, refreshing witbier.', '5.5', '9.9', '17')
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

INSERT INTO beers (name, style, description, ABV, IBU, brewery) VALUES('Better One Or Two', 'Double IPA', 'The original ophthalmic DIPA and first in our arsenal, B12 drips with an ever present cohesion of Citra, Mosaic, and Simcoe that resonate the bold notes of grapefruit, tangerine spritz, ripe red berry, and sticky sap.', '8.0', '21')
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

GO