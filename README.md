# .NET OSCAR  Capstone - Brewery App

## Team Members
- Sally Wood
- Jamie Mullins
- Quintin Owsley
- Rob Newsom

## Use cases

### Required Use Cases
You should attempt to complete all of the following required use cases.

1. **[COMPLETE]** As a user of the system, I need to be able to register myself with a username and password.
2. **[COMPLETE]** As a Beer Lover I can view information about a particular beer so that I can learn more about it.
3. **[COMPLETE]** As a consumer, I want to see a list of beers available, regardless of what brewery they're from.
4. **[COMPLETE]** As a Beer Lover I can view a list of breweries.
   1. **[COMPLETE]** As a Beer Lover I can view information about a brewery to see if it’s somewhere I’d like to visit.
   2. **[COMPLETE]** As a Beer Lover I can view a list of a brewery’s beers to see if there’s a beer I’d like to try or a beer I have tried that I’d like to rate/review.

                                                                       |

## How to set up the database

In the dotnet database folder, you'll find the database creation script `capstone.sql`. Open this in SQL Server Management Studio and execute it.



## API Debugging Tips

- Test your server frequently in Postman
- Try to figure out if your server is getting a valid request (via debugging) and if the server is sending back a valid response (via debugging or Postman)
- Whenever possible, try to eliminate places where the error could be hiding and narrow it down to a specific class or method
- Refer to the debugging flowchart below for additional tips



## Code Review Criteria

- Your code should follow REST conventions wherever possible
- Your API should be secured against unauthenticated attackers
- Your API should forbid unauthenticated users from editing or leaving reviews
- You should not put all of your new controller methods inside of the Login Controller
- You should not put all of your client-side API code inside of the Auth Service
- Try to follow SOLID principles, keep methods small, and keep classes focused on a single responsibility principle