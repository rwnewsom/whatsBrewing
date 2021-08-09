using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public interface IBreweryDAO
    {
        List<Brewery> GetBreweries();

        BreweryDetails GetBreweryById(int id);
        BreweryDetails UpdateBrewery(BreweryDetails brewery);
    }
}
