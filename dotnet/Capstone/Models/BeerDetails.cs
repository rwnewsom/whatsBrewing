using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class BeerDetails
    {
        public int BeerId { get; set; }
        public string Name { get; set; }
        public string Style { get; set; }
        public string Description { get; set; }
        public decimal ABV { get; set; }
        public int? IBU { get; set; }
        public int BreweryId { get; set; }

        public string? BeerImageUrl { get; set; }
    }
}
