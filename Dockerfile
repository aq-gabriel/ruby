FROM ruby:3.1.2
WORKDIR /RUBY
COPY . .
RUN gem install minitest
CMD ["ruby", "maior_ou_menor.rb"]