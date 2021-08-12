using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Authorization;
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
        [Authorize]
        [HttpGet("admin/users")]
        public ActionResult<List<User>> ListAllUsers()
        {
            return Ok(userDAO.DisplayAllUsers());
        }
        
        [HttpDelete("admin/users/{id}")]
        [Authorize]
        public ActionResult DeleteUser(int id)
        {
            bool success = userDAO.DeleteUser(id);
            if (success)
            {
                return Ok();
            }
            else
            {
                return NoContent();
            }
        }

        [HttpPut("admin/users/{id}")]
        [Authorize]
        public ActionResult EditUser(int id, ReturnUser user)
        {
            ReturnUser existingUser = this.userDAO.GetUserById(id);
            if(existingUser == null)
            {
                return NotFound("User could not be found. It may have been deleted.");
            }
            ReturnUser updatedUser = this.userDAO.EditUser(user);

            return Ok(updatedUser);
        }
    }
}
