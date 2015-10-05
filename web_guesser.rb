require 'sinatra'
require 'sinatra/reloader'

number = rand(100)
too_high_message = "Way too high!"
high_message = "Too high!"
low_message = "Too low!"
too_low_message = "Way too low!"
correct = "You got it right!"

get '/' do
  erb :index, :locals => {:number => number,
                          :too_high_message => too_high_message,
                          :high_message => high_message,
                          :low_message => low_message,
                          :too_low_message => too_low_message,
                          :correct => correct}
end
