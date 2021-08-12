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
    public class UserController : Controller
    {
        private readonly IUserDAO userDAO;

        public UserController(IUserDAO userDAO)
        {
            this.userDAO = userDAO;
        }

        [HttpGet("admin/users")]
        public ActionResult<List<User>> ListAllUsers()
        {
            return Ok(userDAO.DisplayAllUsers());
        }
        
    }
}
