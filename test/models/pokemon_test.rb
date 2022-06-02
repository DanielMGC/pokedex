require "./test/test_helper"

class PokemonTest < ActiveSupport::TestCase
    fixtures :pokemons

    def test_pokemon
 
       pokemon = Pokemon.new :number => pokemons(:one).number, 
          :name => pokemons(:one).name,
          :type1 => pokemons(:one).type1,
          :type2 => pokemons(:one).type2,
          :total => pokemons(:one).total,
          :hp => pokemons(:one).hp,
          :attack => pokemons(:one).attack,
          :defense => pokemons(:one).defense,
          :spatk => pokemons(:one).spatk,
          :spdef => pokemons(:one).spdef,
          :speed => pokemons(:one).speed,
          :generation => pokemons(:one).generation,
          :legendary => pokemons(:one).legendary
 
       assert pokemon.save
 
       pokemon_copy = Pokemon.find(pokemon.id)
 
       assert_equal pokemon.name, pokemon_copy.name
 
       pokemon.name = "New Pokemon"
 
       assert pokemon.save
       assert pokemon.destroy
    end
end
