require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

def check_guess(guess)

  guess = guess.to_i
  if guess > NUMBER + 5
    "Way too high!"
  elsif guess > NUMBER
    "Too high!"
  elsif guess < NUMBER
    "Too low!"
  elsif guess < NUMBER - 5
    "Way too low!"
  else
    "You got it right! The SECRET NUMBER is #{NUMBER}"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => NUMBER,
                          :message => message}
end
