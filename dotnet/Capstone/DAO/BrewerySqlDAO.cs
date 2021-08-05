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

        private string sqlListBreweries = "SELECT brewery_id, brewery_name, brewery_description FROM breweries";

        private string sqlBreweryDetails = "SELECT br.brewery_name, br.brewery_description, a.street_number, a.street_name, a.city_name, a.state, a.zip_code, a.phone_number, a.url, a.map_url " +
                                            "FROM breweries br INNER JOIN address a ON br.brewery_id = a.brewery WHERE br.brewery_id = @id"; //TODO: Parameter
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

            using(SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sqlBreweryDetails, conn);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {// If error verify if alias needed
                        breweryDetails.Name = Convert.ToString(reader["brewery_name"]);
                        breweryDetails.Description = Convert.ToString(reader["brewery_description"]);
                        breweryDetails.StreetNumber = Convert.ToInt32(reader["street_number"]);
                        breweryDetails.StreetName = Convert.ToString(reader["street_name"]);
                        breweryDetails.CityName = Convert.ToString(reader["city_name"]);
                        breweryDetails.State = Convert.ToString(reader["state"]);
                        breweryDetails.ZipCode = Convert.ToInt32(reader["zip_code"]);
                        breweryDetails.PhoneNumber = Convert.ToString(reader["phone_number"]);
                        breweryDetails.Url = Convert.ToString(reader["url"]);
                        if(reader["map_url"] != DBNull.Value)
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
            };

            return brewery;
        }
    }
}
