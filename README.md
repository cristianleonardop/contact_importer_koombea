##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.3](https://github.com/organization/project-name/blob/master/.ruby-version#L1)
- Rails [6.0.3.7](https://github.com/organization/project-name/blob/master/Gemfile#L12)
- Node [11.11.0](https://nodejs.org/es/download/releases/)
- Redis

##### 1. Check out the repository

```bash
git clone https://github.com/cristianleonardop/contact_importer_koombea.git
```

##### 2. Yarn install and bundle install

Run the following commands to resolve all the project dependencies(You can use npm instead of yarn).

```ruby
yarn install
bundle install
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rails db:create
rails db:migrate
```

##### 3. Master.key file

You need to create a master.key file to use the credentials.yml.enc

Note: Contact me for further instructions

##### 4. Start the Rails server and Sidekiq

You can start the rails server using the command given below.

```ruby
rails server
```
and the start sidekiq
```ruby
bundle exec sidekiq
```

And now you can visit the site with the URL http://localhost:3000

Also, you can to go live here: https://hidden-eyrie-52356.herokuapp.com/
