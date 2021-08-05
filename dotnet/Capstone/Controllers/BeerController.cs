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
    public class BeerController : Controller
    {
        private readonly IBeersDAO beersDao;
        public BeerController(IBeersDAO beersDao)
        {
            this.beersDao = beersDao;
        }

        [HttpGet("/beer")]
        public ActionResult<List<Beers>> GetAllBeers()
        {
            return Ok(beersDao.DisplayAllBeers());
        }

        [HttpGet("breweries/{id}/beer")]
        public ActionResult<List<Beers>> ListBeers(int id)
        {
            return Ok(beersDao.GetBeers(id));
        }

        [HttpGet("breweries/{id}/beer/{beerId}")]
        public ActionResult<BeerDetails> GetBeerById(int id, int beerId)
        {
            BeerDetails beerDetails = beersDao.GetBeerById(id, beerId);

            if (beerDetails == null)
            {
                return NotFound();
            }
            return Ok(beerDetails);
        }

        [HttpPost("addBeer")]
        public ActionResult AddBeer (BeerDetails beer)
        {
            bool success = beersDao.AddBeer(beer);
            if (success)
            {

                return Ok();
            }
            else
            {
                return StatusCode(500);
            }
        }

        [HttpDelete("/Beer/{id}")]
        public ActionResult DeleteBeer(int id)
        {
            bool success = beersDao.DeleteBeer(id);
            if (success)
            {

                return Ok();
            }
            else
            {
                return NoContent();
            }
        }
    }
}
