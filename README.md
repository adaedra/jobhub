# JobHub

GoHiring Challenge

## Dependencies

* ruby 2.6.5 + bundler
* node 12
* yarn
* Docker & Docker Compose
* postgresql client libs (development package)

## Installation

```sh
bundle install                             # Install gem dependencies
docker-compose up -d                       # Start Postgres
bin/rails db:create db:schema:load db:seed # Initialize database
bin/rails yarn:install                     # Install NodeJS dependencies
bin/rails react_on_rails:locale            # Generate translations
```

## Run it

Just run `rails s`. Webpacker takes care of generating the assets from the rails process.

## What is implemented

* Public site: view all active offers, and see details about an offer. Accessible in French, English and (approximate) German.
* Admin site: protected access by password, list all offers and view details
* API: single entry point to create offers, protected by JWT. Accepts two kinds of data source, one simple using the same structure as the database, another one using GoHiring format.

## Basics

I chose to create from a Rails project from scratch to have the latest Rails environment and see how the existing elements were installed, to better understand them.

For all React elements, I chose to use the hooks format, that was introduced a bit ago in React and is becoming the standard way of doing things. Everything is implemented as functional components.

I added `rubocop` and `eslint` as linters, and did a very basic setup of them. Linters allow to have a consistend code style over the application and catch some easy to miss errors while coding.

I used RSpec as test framework as it seemed to be the one used for the challenge. I tend to prefer RSpec though because of a more complete interface and strong guidelines.

During the development, the project was saved on the Azure DevOps platform, and I used the provided CI to have automated tests. No strong reason other than preference.

I added a Docker Compose file to have an easier setup of a development environment.

## Public site

The public site is a single page application using React through the `react_on_rails` gem. Pages are prerendered by the server, and hydrated on load. Subsequent page openings only load JSON data.

I used `react_on_rails` as it was the suggested library to use, and I have no prior knowledge of react-rails bridging libraries. The implementation allows me to learn the library and how to make an hybrid back/front rendering application.

On the front side, routing is assisted by `react-router`. It is the standard way of doing pages in React, and seemed well-integrated with `react-on-rails`. It provides an experience like classical browsing.

I added Twitter Bootstrap to have a little bit of basic styling, without needing a lot of additional work.

Given the few amount of data, I chose to make my own data store on the client side, instead of using something like Redux that I never worked with before.

I used `react_on_rails` suggested method to add internationalization on server side. Language can be switched on a page by adding `?locale=xx`, `xx` being the desired language (`en`, `fr`). This is a very simple switch just for demonstration purposes.

## Private site

The private site is accessible at `/users/sign_in`. A default user is created with `admin@jobhub.app` / `qwerty1234` credentials.

The log-in page is made with react and pre-rendered. The login itself is done through AJAX, as a way to do a basic use of React on that page.

I used `react-forms` to make the form. It uses a hook-based interface which integrates well with the project.

On the back-end side, I added the Devise gem to manage all authentication concerns. It is a well supported gems with lots of features and extensions. I only used a subset of the provided features, though, like the login tracking.

## API

I only implemented the incoming endpoint for this one, as I chose to focus more on the front-end side which was more unknown to me at the moment.

I protected the endpoint with JWT by implementing a custom Devise strategy, integrating with the rest of the authentication mechanisms.

The API key encoded in the JWT token is the ID of an `Upstream` object, which in turn indicates how to parse the incoming data through the `upstream_module` column. This allows to have multiple partners speaking different API specs.

## Possible next steps

I didn't want to go too far in time on this project, and chose to go for basic features and explore as wide as possible in things to demonstrate. I halted at this point because I felt everything was touched at this point and don't want to take too much time.

The following next steps would be:

* Finish implementing the API spec, with the full workflow.
* Finish implementing the admin interface, with `edit`/`update` and `delete` actions.
* More complete opening offer.
* Translate the whole interface.