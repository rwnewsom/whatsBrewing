using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class ReviewSqlDAO : IReviewDAO
    {
        private readonly string connectionString;
        private readonly string sqlGetReviews = "SELECT review_id, reviewer_name, reviewer_rating, review_description, review_date, beer FROM beer_reviews WHERE beer=@beer";

        public ReviewSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public List<Review> GetReviews(int beer)
        {
            List<Review> reviews = new List<Review>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlGetReviews, conn);
                cmd.Parameters.AddWithValue("@beer", beer);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Review review = GetAllReviewsFromReader(reader);
                        reviews.Add(review);
                    }
                }
            }
            return reviews;
        }

        public Review AddBeerReview(Review review)
        {
           
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO beer_reviews (reviewer_name, beer, reviewer_rating, review_description, review_date) VALUES (@name, @beer, @rating, @description, @date); SELECT @@IDENTITY", conn);
                    cmd.Parameters.AddWithValue("@name", review.ReviewerName);
                    cmd.Parameters.AddWithValue("@beer", review.Beer);
                    cmd.Parameters.AddWithValue("@rating", review.ReviewerRating);
                    cmd.Parameters.AddWithValue("@description", review.ReviewDescription);
                    cmd.Parameters.AddWithValue("@date", DateTime.Now);
                    int newId = Convert.ToInt32(cmd.ExecuteScalar());
                    review.ReviewId = newId;
                    return review;
            }
          
        }

        private Review GetAllReviewsFromReader(SqlDataReader reader)
        {
            Review review = new Review()
            {
                ReviewId = Convert.ToInt32(reader["review_id"]),
                ReviewerName = Convert.ToString(reader["reviewer_name"]),
                ReviewerRating = Convert.ToInt32(reader["reviewer_rating"]),
                ReviewDescription = Convert.ToString(reader["review_description"]),
                ReviewDate = Convert.ToDateTime(reader["review_date"]),
                Beer = Convert.ToInt32(reader["beer"])
            };
            return review;
        }

    }
}
