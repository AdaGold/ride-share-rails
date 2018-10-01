# Rideshare Rails

## At a Glance
- Pair, [stage 2](https://github.com/Ada-Developers-Academy/pedagogy/blob/master/rule-of-three.md#stage-2) project
- Due EOD **DATE HERE**

## Introduction & Objective

In this project you will build a website to model a small community Rideshare app in Rails

There will be two main pieces of functionality:
- New passengers and drivers can sign up for the service and review their information
- Passengers can request and rate trips, and drivers can see their aggregated statistics

This project is meant to be exploratory. Take time to try to dive into each piece of Rails (routes, controllers, models, views). This project is built so that you and your partner can create the waves yourself based on the dependencies of the requirements given.

## Learning Goals

This project should demonstrate your ability to:

1. Create multiple related Active Record Models
1. Create models with validations and methods performing business logic
1. Craft effective RESTful routing
1. Work with a partner to create an attractive and functional Rails site
1. Practice Agile methodology
1. Work with a large amount of existing data in a rails app

## Baseline

### Initial Setup

Before you start writing _any_ code:

- High five your team
- Discuss communication style/feedback style with your team
- Review the requirements with your team
- Follow any instructions given to the class regarding joining a specific Trello team/organization
- Create a Trello board (in the correct team/org if applicable)
  - Write and organize tasks/stories
  - Prioritize tasks/stories
  - Discuss who is interested in which tasks and any scheduling considerations
    - What things should be done together as pairs vs individually?
- Create a diagram based on the data in the CSV files

Once the above is complete, this project:

- Requires a shared repo with your partner as a collaborator
- Requires you to create a Rails application which
  - Conforms to Rails conventions on naming and inflection
  - Is created by using `rails new .` you will create a new rails app _inside_ of the fork folder instead of creating a _new_ folder for your rails app
    - `rails new .` will ask if you want to overwrite the existing files `README.md` and `db/seeds.rb`. Answer `n` to both of these (keep the existing file)
  - Uses [Postgresql](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/how-to-use-postgres.md) as its database. (This should already be configured correctly if you followed our Ada Install Fest for Rails)

**Your team shall submit a pull request with a link to your Trello board once you are done with this initial setup. Your team must message your instructors and notify them that your board is ready for review.**

### Minimum Requirements

However far you and your partner get, the application should have, at a minimum, the following features:

- Seeded data in your database from the original CSV files (see below)
- Multiple related Active Record models
- [RESTful routing](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/08-rails/mvc-and-restful-routing.md)
- Deployed application to [Heroku](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/00-programming-fundamentals/11-deploying-to-heroku.md)
- A "look and feel" that will make you and your partner happy!

### Things to Keep in Mind

1. Use git relentlessly
1. Pair program on difficult problems and to share learning experiences
1. Don't leave deployment to the last second-- it will take longer than you anticipate
1. Business logic should be implemented in the model
1. You will probably need nested routes, but avoid routes that are more than 2 levels deep
1. Use semantic HTML
1. Make good use of partial views
1. Regarding validations:
    - Validations are useful for making sure your database records are sane, and you should make use of them on this project
    - It is easy to validate too much! If it's not a hard requirement for your app to function, it probably shouldn't be a validation
    - If validations fail, let the user know why

### Wireframes

We have provided some wireframes below; they are optional to use for executing layout. However, they should provide guidance for what views and information we instructors are expecting to see and interact with as we grade.

### Seeding the Database

We have provided sample data for your site in the form of CSV files. These files are located in the directory `db/seed_data/`. We have also provided a seed script, `db/seeds.rb`, to load these files into your database.

`db/seeds.rb` assumes a few things about how your database is set up:

- There are `Driver`, `Passenger` and `Trip` models
- These models are related in a certain way
- The field names of these models match the column names in the CSV files

This is the recommended way to configure this project, but not a hard requirement. If you've got a good reason to change the setup, feel free to edit `db/seeds.rb` accordingly.

---

# Requirements

## User Stories

This project has a lot of user stories, and it is likely you and your partner won't get to all of them. Here is our prioritized list of what's important for this project, based on this week's learning goals:

1. CRUD operations on models with relations
    - Creating new trips
1. Model validations and reporting errors to the user
1. Basic structure of a complex Rails app
1. Deployment
1. Complex business logic
    - Driver earning and average rating
1. Styling and design

Please use this list as you decide what to work on (or at the end of the week as you decide what features to cut).

### Overall

- From any page, I can click a menu entry to...
  - View a list of all passengers
  - View a list of all drivers
  - Create a new passenger
  - Create a new driver
- From any form in the site, if processing the form submission fails, the user should be politely informed of what went wrong and how they can correct it

### Working with Passengers

- On the passenger list page I can click on a passenger to see that passenger's details
- On the passenger's details page I can...
  - See the total amount the passenger has been charged
  - See a list of trips that passenger went on
    - Clicking on a trip from the list will take me to a detail page for that trip
  - Click links to edit and delete that passenger
    - It is up to you and your pair on how to deal with "validations" surrounding deleting a passenger associated with a trip
  - Add a new trip for this passenger
    - An available driver is selected automatically by the server
    - The trip starts with no rating
- When adding a new passenger:
  - The user must provide a name and phone number
  - Don't worry about how the phone number is formatted

### Working with Drivers

- On the driver list page I can click on a driver to see that driver's details
- On the driver's details page I can...
  - See the driver's total earnings
    - The driver gets 80% of the trip cost after a fee of $1.65 is subtracted
  - See the driver's average rating
  - See a list of trips this driver has driven
    - Clicking on a trip from the list will take me to a detail page for that trip
  - Click links to edit and delete that driver
    - It is up to you and your pair on how to deal with "validations" surrounding deleting a driver associated with a trip
- When creating a new driver:
  - The user must provide a name and VIN
  - Don't worry about how the VIN is formatted

### Investigating Trips

On the trip details page I can...

- View details of the trip
- Assign a rating (1-5) to the trip, if it does not already have one
- Click links to detail pages for the trip's driver and passenger
- Click links to edit and delete the trip

## Wireframes

Homepage:

![Homepage](images/Rideshare-Rails-Wireframe-homepage.png)

Add a Driver:

![Add A Driver](images/Rideshare-Rails-Wireframe-add-driver.png)

Drivers List:

![Driver List](images/Rideshare-Rails-Wireframe-drivers-index.png)

Driver Show Page:

![Driver Show Page](images/Rideshare-Rails-Wireframe-show-driver.png)

Add a Passenger:

![Add a Passenger](images/Rideshare-Rails-Wireframe-add-passenger.png)

Passenger List:

![Passenger List](images/Rideshare-Rails-Wireframe-passengers-index-page.png)

Passenger Show Page:

![Passenger Show Page](images/Rideshare-Rails-Wireframe-show-passenger.png)

Trip Details:

![Trip Details Page](images/Rideshare-Rails-Wireframe-trip-details.png)


---

## What we're looking for
You can find what instructors will be looking for in the [feedback](feedback.md) markdown document.
