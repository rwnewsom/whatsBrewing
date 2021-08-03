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

        [HttpGet("{id}")]
        public ActionResult<BreweryDetails> GetBreweryById(int id)
        {
            BreweryDetails breweryDetails = breweryDao.GetBreweryById(id);

            if (breweryDetails == null)
            {
                return NotFound();
            }
            return Ok(breweryDetails);
        }
    }
}
