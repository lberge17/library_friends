# LibraryFriends

- This application is meant to store personal reading lists as well as share book recommendations publicly via follower relationships and follow feeds. This application is for the third Flatiron school project. The requirements for the project can be noted in the spec.md file.

## Note on Dependencies
- The application uses ruby on rails as well as a number of other gems as specified in the gem file. The application also uses omniauth for Facebook and thus requires using openssl, eventmachine, and thin to start a 'https' secure server when running this application in a local environment as well as a Facebook developer id and secret--so merely cloning and running bundle install will not run this application with a working 'Log in with Facebook' link.
