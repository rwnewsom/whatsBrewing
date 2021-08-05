using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class ReviewBeersSqlDAO : IReviewBeers
    {
        private readonly string connectionString;
        public ReviewBeers AddBeerReview(ReviewBeers review)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand("INSERT INTO beer_reviews (reviewer_name, reviewer_rating, review_description, review_date) VALUES (@name, @rating, @description, @date)", conn);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@rating", rating);
                cmd.Parameters.AddWithValue("@descriton", description);
                cmd.Parameters.AddWithValue("@date", date);
                cmd.ExecuteNonQuery();
            }




            //    private readonly string connectionString;
            //    public void AddBeerReview(string name, int rating, string description, DateTime date)
            //    {
            //        using (SqlConnection conn = new SqlConnection(connectionString))
            //        {
            //            conn.Open();

            //            SqlCommand cmd = new SqlCommand("INSERT INTO beer_reviews (reviewer_name, reviewer_rating, review_description, review_date) VALUES (@name, @rating, @description, @date)", conn);
            //            cmd.Parameters.AddWithValue("@name", name);
            //            cmd.Parameters.AddWithValue("@rating", rating);
            //            cmd.Parameters.AddWithValue("@descriton", description);
            //            cmd.Parameters.AddWithValue("@date", date);
            //            cmd.ExecuteNonQuery();
            //        }
            //    }
            //}
        }
    }
}
