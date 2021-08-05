using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Review
    {
        /// <summary>
        /// Primary key of SQL
        /// </summary>
        public int ReviewId { get; set; }        
        public string ReviewerName { get; set; }
        public int ReviewerRating { get; set; }
        public string ReviewDescription { get; set; }
        public DateTime ReviewDate { get; set; }
        /// <summary>
        /// Foreign Key representing Beers table
        /// </summary>
        public int Beer { get; set; }

    }
}
