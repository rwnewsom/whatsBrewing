/*
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class ReviewBeers
    {
        public int Id { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        [Range(1, 5)]
        public int Rating { get; set; } = 1;

        public string Description { get; set; }

        public DateTime Date { get; set; }

        [Required]
        public int BeerId { get; set; }
    }
}

*/
