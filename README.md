# Friend Finder

![screenshot](readme_friend_finder.jpg)

Friend Finder is a web application built using [Rails][rails] to help users find and message new friends.

## Functionality
Users can create an account and make a profile including a variety of interests and upload a profile photo. Users can browse through users using common interests as a filtering mechanism as well as send and receive messages.

## Application Info
- Authentication (user registration and login) uses the [bcrypt gem][bcrypt].
- The back end uses [ActiveRecord][active-record] as the ORM. It uses [PostgreSQL][postgres] for the database via the [pg gem][pg].
- The front end leverages Rails ERB templates, with custom styling using [Sass][sass]. The assets are built using [Webpack][webpacker].
- Pagination uses the [Kaminari gem][kaminari].
- Image uploading is managed by [Active Storage][active-storage].

## Install Instructions
In order to get the application to work, install dependencies from the [Gemfile][gemfile] via [Bundler][bundler] by running `bundle install`.

Create the database with `bundle exec rails db:create` and run migrations with `bundle exec rails db:migrate`, then run `bundle exec rails db:seed` to populate the database.

To run the application in development mode after installation, run `bundle exec rails s`.

## Testing
The test suite is developed using Rspec via the [rspec-rails gem][rspec-rails] with [shoulda-matchers][shoulda], while model factories are set up with [FactoryBot][factory-bot].

Tests are located under the [`/spec`][spec-directory] folder. In order to run tests, run `bundle exec rspec` followed by an optional folder or file under the [`/spec`][spec-directory] directory (for example, to test models, run `bundle exec rspec spec/models`).


## License
This project is open source under the terms of the [MIT License][mit].

[rails]: http://rubyonrails.org/
[bcrypt]: https://github.com/bcrypt-ruby/bcrypt-ruby
[active-record]: http://guides.rubyonrails.org/active_record_basics.html
[postgres]: https://www.postgresql.org/
[pg]: https://github.com/ged/ruby-pg
[sass]: http://sass-lang.com/
[kaminari]: https://github.com/kaminari/kaminari
[active-storage]: https://edgeguides.rubyonrails.org/active_storage_overview.html
[bundler]: http://bundler.io/
[gemfile]: https://github.com/MitulMistry/rails-storyplan/blob/master/Gemfile
[webpacker]: https://github.com/rails/webpacker
[rspec-rails]: https://github.com/rspec/rspec-rails
[shoulda]: https://github.com/thoughtbot/shoulda-matchers
[factory-bot]: https://github.com/thoughtbot/factory_bot_rails
[spec-directory]: https://github.com/MitulMistry/friend-finder/blob/master/spec
[mit]: http://opensource.org/licenses/MIT
