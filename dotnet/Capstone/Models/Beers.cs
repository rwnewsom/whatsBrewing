using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Beers
    {
        public int BreweryId { get; set; }
        public int BeerId { get; set; }
        public string Name { get; set; }
        public string Style { get; set; }
        public string BreweryName { get; set; }
        public string? BeerImageUrl { get; set; }

    }
}
