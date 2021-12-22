# Messenger Application

This application was built from a straightforward prompt and set of high level requirements...

> An application that allows two users to send short text messages to each other, like Facebook Messages app or Google Chat.

## Requirements

1. It's possible to type a short message and have it sent to another user
1. It's possible to see messages sent from another user appear reasonably soon after they were sent

# Local environemnt setup

Ensure that the following is installed...

Ruby version 2.7.1
Bundler
Postgresql
Redis

```
git clone https://github.com/benreyn/chatapp.git
cd chatapp
```

Setup the database
```
bin/rails db:setup
bin/rails db:seed
```

Ensure that tests pass

```
bundle exec rspec
```

Run the server

```
bin/rails s
```

And visit localhost:3000 in the browser.

You can login as one of the seeded user accounts (user-1@example.com) or create a new user.




