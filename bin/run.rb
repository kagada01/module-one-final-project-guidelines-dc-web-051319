require_relative '../config/environment'
require "pry"

get_pokemon
welcome
user_input = get_pokemon_from_user
# user_input_confirmation(user_input)
#find_api_match(user_input)


#getting to name level of hash
#iterates all Pokemon names
#if user_input matches, returns true
#else puts error message
# def find_api_match(user_input)
#   results = get_pokemon.each do |category, value|
#     get_pokemon["results"].each do |name_cat, pokemon_name|
#       if name_cat["name"] == user_input.downcase
#         return true
#       else
#         "Sorry, we couldn't find a match :("
#       end
#     end
#   end
# end

# binding.pry
# 0
