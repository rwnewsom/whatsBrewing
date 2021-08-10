using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class BrewerySqlDAO : IBreweryDAO
    {
        private readonly string connectionString;

        private string sqlListBreweries = "SELECT brewery_id, brewery_name, brewery_description, image_url FROM breweries";

        private string sqlBreweryDetails = "SELECT br.brewery_id, br.brewery_name, br.brewery_description, a.street_number, a.street_name, a.city_name, a.state, a.zip_code, a.phone_number, a.url, a.map_url, br.image_url " +
                                            "FROM breweries br INNER JOIN address a ON br.brewery_id = a.brewery WHERE br.brewery_id = @id"; //TODO: Parameter

        private string sqlUpdateBrewery = "BEGIN TRANSACTION UPDATE breweries SET brewery_name = @brewery_name, brewery_description = @brewery_description WHERE brewery_id = @brewery_id UPDATE address SET street_number = @street_number, street_name = @street_name, city_name = @city_name, state = @state, zip_code = @zip_code, phone_number = @phone_number, map_url = @map_url, url = @url WHERE brewery = @brewery_id COMMIT TRANSACTION";
        private string sqlNewBrewery = "INSERT INTO breweries (brewery_name, brewery_description, image_url) VALUES (@brewery_name, @brewery_description, @image_url); " +
            "INSERT INTO address(street_number, street_name, city_name, state, zip_code, phone_number, brewery, url, map_url) VALUES(@street_number, @street_name, @city_name, @state, @zip_code, @phone_number, (SELECT @@IDENTITY), @url, @map_url)";
        
        public BrewerySqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public List<Brewery> GetBreweries()
        {
            List<Brewery> breweries = new List<Brewery>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlListBreweries, conn);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Brewery brewery = GetBreweriesFromReader(reader);
                        breweries.Add(brewery);
                    }
                }
            }
            return breweries;
        }

        public BreweryDetails GetBreweryById(int id)
        {
            BreweryDetails breweryDetails = new BreweryDetails();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sqlBreweryDetails, conn);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {// If error verify if alias needed
                        breweryDetails.Id = Convert.ToInt32(reader["brewery_id"]);
                        breweryDetails.Name = Convert.ToString(reader["brewery_name"]);
                        breweryDetails.Description = Convert.ToString(reader["brewery_description"]);
                        breweryDetails.StreetNumber = Convert.ToInt32(reader["street_number"]);
                        breweryDetails.StreetName = Convert.ToString(reader["street_name"]);
                        breweryDetails.CityName = Convert.ToString(reader["city_name"]);
                        breweryDetails.State = Convert.ToString(reader["state"]);
                        breweryDetails.ZipCode = Convert.ToInt32(reader["zip_code"]);
                        breweryDetails.PhoneNumber = Convert.ToString(reader["phone_number"]);
                        breweryDetails.Url = Convert.ToString(reader["url"]);
                        if (reader["map_url"] != DBNull.Value)
                        {
                            breweryDetails.MapUrl = Convert.ToString(reader["map_url"]);
                        }
                    }
                    return breweryDetails;
                }
                return null;
            }


        }

        private Brewery GetBreweriesFromReader(SqlDataReader reader)
        {
            Brewery brewery = new Brewery()
            {
                Id = Convert.ToInt32(reader["brewery_id"]),
                Name = Convert.ToString(reader["brewery_name"]),
                Description = Convert.ToString(reader["brewery_description"]),
                ImageURL = Convert.ToString(reader["image_url"]),
            };

            return brewery;
        }

        public BreweryDetails UpdateBrewery(BreweryDetails brewery)
        {
            using (SqlConnection conn = new SqlConnection(this.connectionString))
            {
                conn.Open();

                SqlCommand command = new SqlCommand(sqlUpdateBrewery, conn);
                command.Parameters.AddWithValue("@brewery_name", brewery.Name);
                command.Parameters.AddWithValue("@brewery_description", brewery.Description);
                command.Parameters.AddWithValue("@brewery_id", brewery.Id);
                command.Parameters.AddWithValue("@street_number", brewery.StreetNumber);
                command.Parameters.AddWithValue("@street_name", brewery.StreetName);
                command.Parameters.AddWithValue("@city_name", brewery.CityName);
                command.Parameters.AddWithValue("@state", brewery.State);
                command.Parameters.AddWithValue("@zip_code", brewery.ZipCode);
                command.Parameters.AddWithValue("@phone_number", brewery.PhoneNumber);
                command.Parameters.AddWithValue("@map_url", brewery.MapUrl);
                command.Parameters.AddWithValue("@url", brewery.Url);

                command.ExecuteNonQuery();
            }

            BreweryDetails updatedBrewery = GetBreweryById(brewery.Id);
            return updatedBrewery;
        }

        public bool NewBrewery(BreweryDetails brewery)
        {
            using (SqlConnection conn = new SqlConnection(this.connectionString))
            {
                conn.Open();

                SqlCommand command = new SqlCommand(sqlNewBrewery, conn);
                command.Parameters.AddWithValue("@brewery_name", brewery.Name);
                command.Parameters.AddWithValue("@brewery_description", brewery.Description);
                command.Parameters.AddWithValue("@image_url", brewery.ImageUrl); ;
                command.Parameters.AddWithValue("@street_number", brewery.StreetNumber);
                command.Parameters.AddWithValue("@street_name", brewery.StreetName);
                command.Parameters.AddWithValue("@city_name", brewery.CityName);
                command.Parameters.AddWithValue("@state", brewery.State);
                command.Parameters.AddWithValue("@zip_code", brewery.ZipCode);
                command.Parameters.AddWithValue("@phone_number", brewery.PhoneNumber);
                command.Parameters.AddWithValue("@brewery", brewery.Id);
                command.Parameters.AddWithValue("@url", brewery.Url);
                command.Parameters.AddWithValue("@map_url", brewery.MapUrl);
                int added = command.ExecuteNonQuery();
                return added == 2;
            }
        }
    }
}
