require_relative '../config/environment'
require 'pry'

def welcome
  puts "Welcome to our Pokemon InfoDex!"
end

def get_pokemon_from_user
  puts "Please enter the name of the Pokemon you'd like to know more about:"
  user_input = gets.chomp.to_s
  user_input_confirmation(user_input)
end

def no_match
  puts "Sorry that Pokemon didn't match! Please try again"
  user_input = gets.chomp.downcase.to_s
  user_input_confirmation(user_input)
end

def find_api_match(user_input)
  pokemon_names = get_pokemon["results"].find do |pokemon_obj|
    pokemon_obj["name"].downcase == user_input.downcase
  end
    if pokemon_names
      pokemon_file = "#{pokemon_names['url']}"
      parsed_pokemon = get_selected_pokemon(pokemon_file)
      pokemon_options(parsed_pokemon)
    else
      no_match
    end
end

def user_input_confirmation(user_input)
  puts "Is #{user_input.titleize} the correct Pokemon? (Y/N)"
  user_confirmation = gets.chomp.downcase
    if user_confirmation == "y"
      ##Give user options for information type for that pokemon (Abilities, Moves, Location)
      find_api_match(user_input)
    elsif user_confirmation == "n"
      puts "Please re-enter the Pokemon you'd like to search:"
      user_input = gets.chomp.downcase
      find_api_match(user_input)
    else
      puts "Sorry I didn't understand that answer"
      puts "Please re-enter the Pokemon you'd like to search:"
      user_input = gets.chomp.downcase
    end
end

def pokemon_options(parsed_pokemon)
  puts "Thank you for selecting your Pokemon!"
  puts "Please see the InfoDex Menu below: \n\n"
  puts "Enter: 'abilities' to return all of your pokemon's abilities\n"
  puts "Enter: 'id' to return your pokemon's PokeDex ID\n"
  puts "Enter: 'height' to return your pokemon's height\n"
  puts "Enter: 'weight' to return your pokemon's weight\n"
  puts "OR enter 'q' to exit the application."
user_choice = gets.chomp.downcase
case user_choice
when 'abilties'
  puts "abilities!"
when 'id'
  puts 'id!'
when 'height'
  puts "height!"
when  'weight'
  puts "weight!"
when 'q'
  puts "You want to quit?!?!"
else
  puts "Sorry, I didn't understand the request. Please enter one of the menu items above."
end
#depending on the user's entry, iterate into the proper level of the specific pokemon hash
#return appropriate values in the form
#user_choice
binding.pry
end
