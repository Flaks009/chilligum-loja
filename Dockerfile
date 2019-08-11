FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /chilligum
WORKDIR /chilligum
COPY Gemfile /chilligum/Gemfile
COPY Gemfile.lock /chilligum/Gemfile.lock
RUN bundle install
COPY . /chilligum

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]