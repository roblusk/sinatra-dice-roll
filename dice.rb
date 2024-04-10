require "sinatra"
require "sinatra/reloader"

require "better_errors"
require "binding_of_caller"

# Needed for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get("/") do
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"

  erb(:two_six)
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  @outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"
  
  erb(:two_ten)
end

get("/dice/1/20") do
  @die = rand(1..20)

  erb(:one_twenty)
end

get("/dice/5/4") do
  @sum = 0

  5.times do
    @sum += rand(1..4)
  end

  erb(:five_four)
end

get("/dice/1000/6") do
  @sum = 0

  1000.times do
    @sum += rand(1..6)
  end

  erb(:thousand_six)
end
