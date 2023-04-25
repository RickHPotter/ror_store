# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

> ruby 3.2.2 (2023-03-30 revision e51014f9c0) [x86_64-linux]

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## DEPLOY

I used Railway.

* RAILS ENV

1. Add `url: <%= ENV["DATABASE_URL"] %>` to 'database.yml', inside `production:`.
1. Create a `Procfile` in the root of your application and write to it :

    ```ruby
    web: rake db:migrate && bin/rails server -b 0.0.0.0 -p ${PORT}
    ```

1. Move your `gem 'sqlite3'` into `group :development, :test do` in 'database.yml' file.
1. Insert `gem 'pg'` into `group :production do` in the same file.
1. Run `bundle install`.
1. Add `config.hosts << "<<github_repo_name_withou_underscore>-production.up.railway.app"` inside `Rails.application.configure do` in these two files: `config/environments/[production/development].rb`.

* GIT ENV

1. `git add .`
1. `git commit -m 'deploying'`
1. `git push`

* RAILWAY ENV

1. Create new Redis.
1. Create new Postgres DB inside Redis.
1. Create new Github Repo and choose this repo.
1. Wait a billion years.
1. Generate a domain and access it.
