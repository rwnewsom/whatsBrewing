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

        private string sqlListBeers = "SELECT beer_id, name, style FROM beers WHERE brewery = @id";
        private string sqlBeerDetails = "SELECT beer_id, name, style, description, ABV, IBU FROM beers WHERE brewery = @id AND beer_id = @beerId";

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
            };

            return beers;
        }
    }
}
