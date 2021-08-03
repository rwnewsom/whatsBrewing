using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public interface IBeersDAO
    {
        List<Beers> GetBeers();

        BeerDetails GetBeerById(int id);
    }
}
