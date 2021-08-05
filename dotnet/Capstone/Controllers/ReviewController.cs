using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class ReviewController : Controller
    {
        private readonly IReviewDAO reviewDAO;
        private readonly IReviewBeer reviewBeersDAO;

        public ReviewController(IReviewDAO reviewDAO)
        {
            this.reviewDAO = reviewDAO;
        }

        [HttpGet("reviews/{beer}")]
        public ActionResult<List<Review>> ListReviews(int beer)
        {
            return Ok(reviewDAO.GetReviews(beer));
        }

        [HttpPost("addReview")]
        public ActionResult AddBeerReview(string name, int rating, string description, DateTime date)
        {
            ActionResult result;
            ReviewBeers review = reviewBeersDAO.AddBeerReview();
        }


    }
}
