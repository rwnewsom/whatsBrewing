using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Capstone.Models;
using Capstone.Security;
using Capstone.Security.Models;

namespace Capstone.DAO
{
    public class UserSqlDAO : IUserDAO
    {
        private readonly string connectionString;

        private string sqlGetUser = "SELECT user_id, username, password_hash, salt, user_role FROM users WHERE username = @username";
        private string sqlAddUser = "INSERT INTO users (username, password_hash, salt, user_role) VALUES " +
            "(@username, @password_hash, @salt, @user_role)";
        private string sqlDisplayAllUsers = "SELECT user_id, username, user_role FROM users";

        public UserSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public User GetUser(string username)
        {
            User returnUser = null;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlGetUser, conn);
                cmd.Parameters.AddWithValue("@username", username);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows && reader.Read())
                {
                    returnUser = GetUserFromReader(reader);
                }
            }

            return returnUser;
        }


        public User AddUser(string username, string password, string role)
        {
            IPasswordHasher passwordHasher = new PasswordHasher();
            PasswordHash hash = passwordHasher.ComputeHash(password);

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlAddUser, conn);
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@password_hash", hash.Password);
                cmd.Parameters.AddWithValue("@salt", hash.Salt);
                cmd.Parameters.AddWithValue("@user_role", role);
                cmd.ExecuteNonQuery();
            }

            return GetUser(username);
        }

        private User GetUserFromReader(SqlDataReader reader)
        {
            User u = new User()
            {
                UserId = Convert.ToInt32(reader["user_id"]),
                Username = Convert.ToString(reader["username"]),
                PasswordHash = Convert.ToString(reader["password_hash"]),
                Salt = Convert.ToString(reader["salt"]),
                Role = Convert.ToString(reader["user_role"]),
            };

            return u;
        }


        public List<ReturnUser> DisplayAllUsers()
        {
            List<ReturnUser> users = new List<ReturnUser>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sqlDisplayAllUsers, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        ReturnUser userToDisplay = GetAllUsersFromReader(reader);
                        users.Add(userToDisplay);
                    }
                }
            }
            return users;
        }


        /// <summary>
        /// For admin control panel, need user object without credentials
        /// </summary>
        /// <param name="reader">SQL Datareader</param>
        /// <returns>A user object to be added to a list</returns>
        private ReturnUser GetAllUsersFromReader(SqlDataReader reader)
        {
            ReturnUser u = new ReturnUser()
            {
                UserId = Convert.ToInt32(reader["user_id"]),
                Username = Convert.ToString(reader["username"]),
                Role = Convert.ToString(reader["user_role"]),
            };
            return u;
        }

        public ReturnUser GetUserById(int id)
        {
            ReturnUser returnUser = new ReturnUser();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT user_id, username, user_role FROM users WHERE user_id = @id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        returnUser.UserId = Convert.ToInt32(reader["user_id"]);
                        returnUser.Username = Convert.ToString(reader["username"]);
                        returnUser.Role = Convert.ToString(reader["user_role"]);
                    }
                }
                return returnUser;
            }
 
        }

        public ReturnUser EditUser(ReturnUser user)
        {
            using (SqlConnection conn = new SqlConnection(this.connectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand("UPDATE users SET user_role=@role WHERE user_id =@id", conn);
                command.Parameters.AddWithValue("@role", user.Role);
                command.Parameters.AddWithValue("@id", user.UserId);
                command.ExecuteNonQuery();
                
            }
            return user;
            
        }

        public bool DeleteUser(int id)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM users WHERE user_id = @id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                int deleted = cmd.ExecuteNonQuery();

                return deleted ==1;

            }

        }

    }
}
