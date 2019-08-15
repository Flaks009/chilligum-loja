FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /chilligum
WORKDIR /chilligum
COPY Gemfile /chilligum/Gemfile
COPY Gemfile.lock /chilligum/Gemfile.lock
RUN bundle install
COPY . /chilligum

#Migrate
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]