FROM ruby:2.4.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /boilerplate_app

WORKDIR /boilerplate_app

COPY Gemfile /boilerplate_app/Gemfile
COPY Gemfile.lock /boilerplate_app/Gemfile.lock

RUN gem update --system && gem install bundler

COPY . /boilerplate_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]

EXPOSE 5000

# Start the main process.
CMD [ "rails", "server", "-b", "0.0.0.0" ]
