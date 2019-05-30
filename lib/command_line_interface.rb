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
      find_api_match(user_input)
    end
end

def pokemon_options(parsed_pokemon)
  puts "Thank you for selecting your Pokemon!"
  puts "Please see the InfoDex Menu below: \n\n"
  puts "Enter 1: 'abilities' to return all of your pokemon's abilities\n"
  puts "Enter 2: 'id' to return your pokemon's PokeDex ID\n"
  puts "Enter 3: 'height' to return your pokemon's height\n"
  puts "Enter 4: 'weight' to return your pokemon's weight\n"
  puts "Enter 'q': to exit the application."
  user_choice = gets.chomp.downcase
  case user_choice
  when "1"
    get_abilities(parsed_pokemon)
  when "2"
    get_pokedex_id(parsed_pokemon)
  when "3"
    get_pokemon_height(parsed_pokemon)
  when "4"
    get_pokemon_weight(parsed_pokemon)
  when "q"
    exit_info_dex
  else
    puts "Sorry, I didn't understand the request"
    pokemon_options(parsed_pokemon)
  end
end

def get_abilities(parsed_pokemon)
  all_abilities = []
  parsed_pokemon["abilities"].each do |category|
    category["ability"].select do |key, value|
      if key == "name"
        all_abilities << value
      end
    end
  end
    p all_abilities
    puts "Would you like to find out more about your Pokemon? (Y/N)"
    puts "Or enter any other key to go back to the main menu"
    user_selection = gets.chomp.downcase
      if user_selection == "y"
        pokemon_options(parsed_pokemon)
      elsif user_selection == "n"
        exit_info_dex
      else
        pokemon_options(parsed_pokemon)
      end
end

def get_pokemon_height(parsed_pokemon)
  pokemon_height = parsed_pokemon["height"]
  p "Your Pokemon's height is #{pokemon_height/10.0}m"
  puts "Would like to find out more about your Pokemon? (Y/N)"
  puts "Or enter any other key to go back to the main menu"
  user_selection = gets.chomp.downcase
    if user_selection == "y"
      pokemon_options(parsed_pokemon)
    elsif user_selection == "n"
      exit_info_dex
    else
      pokemon_options(parsed_pokemon)
    end
end

def get_pokemon_weight(parsed_pokemon)
  pokemon_weight = parsed_pokemon["weight"]
  p "Your Pokemon's weight is #{pokemon_weight}lbs"
  puts "Would like to find out more about your Pokemon? (Y/N)"
  puts "Or enter any other key to go back to the main menu"
  user_selection = gets.chomp.downcase
    if user_selection == "y"
      pokemon_options(parsed_pokemon)
    elsif user_selection == "n"
      exit_info_dex
    else
      pokemon_options(parsed_pokemon)
    end
end

def get_pokedex_id(parsed_pokemon)
  poke_id = parsed_pokemon["id"]
  p "Your Pokemon's PokeDex ID# is #{poke_id}."
  puts "Would like to find out more about your Pokemon? (Y/N)"
  puts "Or enter any other key to go back to the main menu"
  user_selection = gets.chomp.downcase
    if user_selection == "y"
      pokemon_options(parsed_pokemon)
    elsif user_selection == "n"
      exit_info_dex
    else
      pokemon_options(parsed_pokemon)
    end
end

def exit_info_dex
  puts "Thank you for using our InfoDex!!"
# binding.pry
  exit
end
