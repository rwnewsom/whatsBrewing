using System.Collections.Generic;
using Capstone.Models;

namespace Capstone.DAO
{
    public interface IUserDAO
    {
        User GetUser(string username);
        User AddUser(string username, string password, string role);

        List<ReturnUser> DisplayAllUsers();

        bool DeleteUser(int id);

        ReturnUser EditUser(ReturnUser user);

        ReturnUser GetUserById(int id);
    }
}
