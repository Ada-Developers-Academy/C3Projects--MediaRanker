# Media Ranker

In this project we will focus on build a simple rails app that has three data models (Movie, Album, Book). We will be focusing on rails request cycle comprehension and introducing testing to our rails applications. To maximize the focus on comprehension, students will implement features based off of an existing website (http://media-ranker.herokuapp.com).

### Goals

By the end of the project students should be able to:

- Implement tests in a rails application
- Use built-in model validators
- Use and create custom model validations?
- Describe the rails request cycle in their own words

<!--
- Understand details about the state of the application at any point during a request:
    - `self`
    - @instance variables
    - local variables
    - request data (`params`, `session`, etc...) (if applicable)
    - Available methods to the current scope
    - The line of code the app has stopped running on
-->
### Baseline
Before you start writing _any_ code:

- Explore the existing Media Ranker site to become familiar with the necessary functionality
- If desired, create a Trello board to manage tasks
- If desired, create an ERD diagram for the models

Once you've explored the existing Media Ranker site, this project:

- requires an individual repo and branch
- will need to be isolated into a gemset called 'MediaRanker'
  - create the necessary files for RVM to recognize a gemset
  - Use [better_errors](https://github.com/charliesome/better_errors) for debugging purposes
- requires you to create a Rails 4.2.2 application
  - conform to Rails conventions on naming and inflection
- requires one preliminary passing RSpec test that confirms that your web application can render the root route
  - the `spec` folder should be created at the top-level of the application

### Requirements

#### Functionality

You must mimic **ALL** of the pages and **ALL** of the links and buttons on each of the pages located at http://media-ranker.herokuapp.com.

Each data model needs to have standard RESTful (index, show, edit, update, new, create, destroy) routes.

Research and ask as many questions as possible, at the end of the week you will be expected to have a 75% - 90% comprehension of the basic usage and role of:

- Routes
- Controllers
- Views
- Models

If any piece feels like magic, google it, debug it, ask questions, unless you are specifically told that a certain piece is too magic to concern yourself with.

The project will not be required to be in any certain state at the end of the week. You will only be graded on your ability to describe and assess the process of a rails request cycle, and the state of any given point within a similar piece of code.

#### Testing

Tests should focus on the different areas of the rails request cycle.

## TODO!
