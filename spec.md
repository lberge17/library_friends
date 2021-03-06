## Specifications for the Rails Assessment

# Specs:
- [x] Using Ruby on Rails for the project
- application generated via the command 'rails new'

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- user has_many books through library and vice versa. libraries (join table) belong_to a book and a user

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- This is fulfilled through the Recommendation join model that includes a comment attribute.

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- I have various validations for my models (aside from the ones already provided with devise). The main ones are in my book model that contains a validations for title and author on presence, length, and uniqueness of the combination of both (since some books have the same title but different authors and authors have multiple books).

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- The libraries model has a popular_books scope method and URL that returns the 5 most popular books in user libraries.

- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- I use devise for signup/login/logout

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- I use Facebook through the facebook omniauth gem.

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- recommendations are nested under users

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- a new book can be created from a nested form in the libraries form

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
- There are validation errors listed in the books new view if the book is invalid.


# Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate