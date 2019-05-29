require 'rest-client'
require 'JSON'

def get_pokemon
  pokemon_data = RestClient.get('https://pokeapi.co/api/v2/pokemon?limit=964')
  pokemon_data_parsed = JSON.parse(pokemon_data)
  pokemon_data_parsed
end

def get_selected_pokemon(pokemon_file)
  selected_pokemon_data = RestClient.get(pokemon_file)
  selected_pokemon_data_parsed = JSON.parse(selected_pokemon_data)
  selected_pokemon_data_parsed
end
