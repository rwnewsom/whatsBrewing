using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    public class BreweryController : Controller
    {
        private readonly IBreweryDAO breweryDao;
        

        public BreweryController(IBreweryDAO breweryDao)
        {
            this.breweryDao = breweryDao;
        }

        [HttpGet("breweries")]
        public ActionResult<List<Brewery>> ListBreweries()
        {
            return Ok(breweryDao.GetBreweries());
        }

        [HttpGet("breweries/{id}")]
        public ActionResult<BreweryDetails> GetBreweryById(int id)
        {
            BreweryDetails breweryDetails = breweryDao.GetBreweryById(id);

            if (breweryDetails == null)
            {
                return NotFound();
            }
            return Ok(breweryDetails);
        }

        [HttpPut("breweries/{id}")]
        [Authorize]
        public ActionResult EditBrewery(int id, BreweryDetails updatedBrewery)
        {
            BreweryDetails brewery = this.breweryDao.GetBreweryById(id);
            if (brewery == null)
            {
                return NotFound("Brewery could not be found. It may have been deleted.");
            }

            BreweryDetails newBrewery = this.breweryDao.UpdateBrewery(updatedBrewery);

            return Ok(newBrewery);
        }

        [HttpPost("newBrewery")]
        public ActionResult NewBrewery(BreweryDetails brewery)
        {
            BreweryDetails success = this.breweryDao.NewBrewery(brewery);

            return Ok(success);
        }
    }
}
