﻿using Capstone.DAO;
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
        public ActionResult AddBeerReview(ReviewBeers review)
        {
            ActionResult result;
            bool success = reviewDAO.AddBeerReview(review);
            if (success)
            {

                return Ok();
            }
            else
            {
                return StatusCode(500);
            }
        }


    }
}
