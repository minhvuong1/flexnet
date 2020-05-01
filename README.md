# Flexnet

## General Requirements
Have ideally 2 resources(tables) (more if they make sense) – one representing someone using your application, and one that represents the main functional idea for your app

Include sign up/log in functionality(if they make sense), with encrypted passwords & an authorization flow

Have complete RESTful routes for at least one of your resources with GET, POST, PATCH, and DELETE

Include wireframes that you designed during the planning process

Have semantically clean HTML and CSS

Be deployed online and accessible to the public

## Development
1. HTML
2. CSS
3. Ruby
4. Sinatra
5. PostGreSQL
6. Heroku

I started by sketching page structures, layouts, SQL tables that I needed to use on a whiteboard in order for the app to function correctly. I started by designing the page through VSCode using Embed Ruby in HTML, CSS and Javascript. Throughout
the 3 days of development I used "pry" and "sinatra/reloader" to help the debugging stages be much more straightfoward. All the data is stored in the SQL by using Ruby to
manipulate data and display to the browser. Bcypt is a library that was also used allowing to easily store a secure hash of all users' passwords. The application is deployed by Heroku. Here is the link:

https://flexnet.herokuapp.com/