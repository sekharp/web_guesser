require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

def check_guess(guess)
  if guess.nil?
    ""
  elsif guess.to_i > NUMBER + 5
    "Way too high!"
  elsif guess.to_i > NUMBER
    "Too high!"
  elsif guess.to_i < NUMBER
    "Too low!"
  elsif guess.to_i < NUMBER - 5
    "Way too low!"
  else
    "You got it right! The SECRET NUMBER is #{NUMBER}"
  end
end

def cheat_message(cheat)
  if cheat == "true"
    "The SECRET NUMBER is #{NUMBER}"
  end
end

get '/' do
  guess = params["guess"]
  cheat = params["cheat"]
  message = check_guess(guess)
  hint = cheat_message(cheat)

  erb :index, :locals => {:number => NUMBER,
                          :message => message,
                          :hint => hint}
end
