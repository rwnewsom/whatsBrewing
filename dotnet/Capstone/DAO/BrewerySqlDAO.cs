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
