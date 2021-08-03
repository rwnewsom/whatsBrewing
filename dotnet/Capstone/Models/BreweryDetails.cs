using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class BreweryDetails
    {

        /// <summary>
        /// Id represents primary key of database
        /// </summary>
        
        public string Name { get; set; }
        public string Description { get; set; }

        public int StreetNumber { get; set; }

        public string StreetName { get; set; }

        public string CityName { get; set; }

        public string State { get; set; }

        public int ZipCode { get; set; }

        public string PhoneNumber { get; set; }

        public string Url { get; set; }

    }
}
