#Carly Jugler's Media Ranker

In this project we will focus on build a simple rails app that has three data models (Movie, Album, Book). We will be focusing on rails request cycle comprehension and introducing testing to our rails applications. To maximize the focus on comprehension, students will implement features based off of an existing website (http://media-ranker.herokuapp.com).

You will be required to submit a single pull request at the end of this week, rather than pull requests after each wave.

### Goals

By the end of the project you should be able to:

- Implement tests in a rails application
- Use built-in model validators
- Describe the rails request cycle in detail in your own words

### Baseline
Before you start writing _any_ code:

- Explore the existing Media Ranker site to become familiar with the necessary functionality
- If desired, create a Trello board to manage tasks
- If desired, create an ERD diagram for the models (pen & paper first)

Once you've explored the existing Media Ranker site, this project:

- requires an individual repo and branch
- will need to be isolated into a gemset called 'MediaRanker'
  - create the necessary files for RVM to recognize a gemset
  - Use [better_errors](https://github.com/charliesome/better_errors) for debugging purposes
- requires you to create a Rails 4.2.2 application
  - conform to Rails conventions on naming and inflection

### Requirements

#### Comprehension

Take your time to understand how the code is being executed during the request cycle. Use the skill check questions to drive your exploration. Work with your classmates to describe the flow of a specific request to any of the routes in your route file. You should be able to do this for all of the routes in your application.

#### Wave 1

You must mimic **ALL** of the pages and **ALL** of the links and buttons on each of the pages located at http://media-ranker.herokuapp.com.

Each data model needs to have standard RESTful (index, show, edit, update, new, create, destroy) routes.

#### Wave 2

Testing will come in Wave 2!

#### Wave 3

Style will come in Wave 3!

<!--
- [Tuesday] requires one preliminary passing RSpec test that confirms that your web application can render the root route
  - the `spec` folder should be created at the top-level of the application
-->
