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

        [HttpGet("breweries/{id}/beer")]
        public ActionResult<List<Beers>> ListBeers(int id)
        {
            return Ok(beersDao.GetBeers(id));
        }

        //[HttpGet("breweries/{id}")]
        //public ActionResult<BreweryDetails> GetBreweryById(int id)
        //{
        //    BreweryDetails breweryDetails = breweryDao.GetBreweryById(id);

        //    if (breweryDetails == null)
        //    {
        //        return NotFound();
        //    }
        //    return Ok(breweryDetails);
        //}
    }
}
