using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class BeersSqlDAO : IBeersDAO
    {
        private readonly string connectionString;

        private string sqlListBeers = "SELECT b.beer_id, b.name, b.style, b.beer_image_url, b.brewery, br.brewery_name FROM beers b INNER JOIN breweries br ON b.brewery = br.brewery_id WHERE brewery = @id";
        private string sqlBeerDetails = "SELECT beer_id, brewery, name, style, beer_image_url, description, ABV, IBU FROM beers WHERE brewery = @id AND beer_id = @beerId";
        private string sqlDisplayAllBeers = "SELECT beers.beer_id, beers.name, beers.beer_image_url, beers.style, breweries.brewery_name, breweries.brewery_id FROM beers JOIN breweries ON beers.brewery = breweries.brewery_id";

        public BeersSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public List<Beers> GetBeers(int id)
        {
            List<Beers> beers = new List<Beers>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlListBeers, conn);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Beers beer = GetBeersFromReader(reader);
                        beers.Add(beer);
                    }
                }
            }
            return beers;
        }

        public List<Beers> DisplayAllBeers()
        {
            List<Beers> beers = new List<Beers>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlDisplayAllBeers, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Beers beerToDisplay = GetAllBeersFromReader(reader);
                        beers.Add(beerToDisplay);
                    }
                }
            }
            return beers;
        }

        public BeerDetails GetBeerById(int id, int beerId)
        {
            BeerDetails beerDetails = new BeerDetails();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sqlBeerDetails, conn);
                cmd.Parameters.AddWithValue("@beerId", beerId);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {// If error verify if alias needed
                        beerDetails.BeerId = Convert.ToInt32(reader["beer_id"]);
                        beerDetails.Name = Convert.ToString(reader["name"]);
                        beerDetails.Style = Convert.ToString(reader["style"]);
                        beerDetails.Description = Convert.ToString(reader["description"]);
                        beerDetails.ABV = Convert.ToDecimal(reader["ABV"]);
                        if (reader["IBU"] != DBNull.Value)
                        {
                            beerDetails.IBU = Convert.ToInt32(reader["IBU"]);
                        }

                    }

                    return beerDetails;
                }

                return null;
            }


        }

        private Beers GetBeersFromReader(SqlDataReader reader)
        {
            Beers beers = new Beers()
            {
                Name = Convert.ToString(reader["name"]),
                Style = Convert.ToString(reader["style"]),
                BeerId = Convert.ToInt32(reader["beer_id"]),
                BreweryId = Convert.ToInt32(reader["brewery"]),
                BreweryName = Convert.ToString(reader["brewery_name"]),
                BeerImageUrl = Convert.ToString(reader["beer_image_url"])
            };
            return beers;
        }

        private Beers GetAllBeersFromReader(SqlDataReader reader)
        {
            Beers beers = new Beers()
            {
                Name = Convert.ToString(reader["name"]),
                Style = Convert.ToString(reader["style"]),
                BeerId = Convert.ToInt32(reader["beer_id"]),
                BreweryName = Convert.ToString(reader["brewery_name"]),
                BreweryId = Convert.ToInt32(reader["brewery_id"]),
                BeerImageUrl = Convert.ToString(reader["beer_image_url"])
            };
            return beers;
        }

        public BeerDetails AddBeer(BeerDetails beer)
        {

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO beers (name, beer_image_url, style, description, ABV, IBU, brewery) VALUES (@name, @beerUrl, @style, @description, @ABV, @IBU, @brewery); SELECT @@IDENTITY", conn) ;
                cmd.Parameters.AddWithValue("@name", beer.Name);
                cmd.Parameters.AddWithValue("@beerUrl", beer.BeerImageUrl);
                cmd.Parameters.AddWithValue("@style", beer.Style);
                cmd.Parameters.AddWithValue("@description", beer.Description);
                cmd.Parameters.AddWithValue("@ABV", beer.ABV);
                cmd.Parameters.AddWithValue("@IBU", beer.IBU);
                cmd.Parameters.AddWithValue("@brewery", beer.BreweryId);
                int newId = Convert.ToInt32(cmd.ExecuteScalar());
                beer.BeerId = newId;
                return beer;
            }


        }

        public bool DeleteBeer(int id)
        {

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("BEGIN TRANSACTION DELETE FROM beers WHERE beer_id = @id DELETE FROM beer_reviews WHERE beer = @id COMMIT TRANSACTION", conn);
                cmd.Parameters.AddWithValue("@id", id);

                int added = cmd.ExecuteNonQuery();
                return added == 1;
            }


        }
    }
}
