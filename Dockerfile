# gets the docker image of ruby 2.5 and lets us build on top of that
FROM ruby:2.6.3

# install rails dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libsqlite3-dev

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
