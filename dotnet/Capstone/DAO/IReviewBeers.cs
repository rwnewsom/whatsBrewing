using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public interface IReviewBeer
    {
        //maybe take in beer id as a param later
        ReviewBeers AddBeerReview(ReviewBeers review);
    }
}
