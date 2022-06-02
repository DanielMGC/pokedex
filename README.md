# README

-- REST API Endpoints:

-> GET /pokemon
    Description: lists all Pokemon or a paginated list
    Parameters (uri): 
        * page_size (optional): number of Pokemon that the paginated list should contain
        * page (optional): number of the page within the pagination
    Examples:
        /pokemon (lists all Pokemon)
        /pokemon?page_size=10&page=5 (lists 5th page containing 10 Pokemon, i.e. from 51 to 60)

-> GET /pokemon/{id}
    Description: shows the Pokemon with the given ID
    Parameters (uri):
        * id: the database ID of the Pokemon to show. Error will be thrown if the ID does not exist in the database.
    Examples:
        /pokemon/100 (shows the Pokemon with ID 100)

-> POST /pokemon
    Description: creates a new Pokemon in the database and shows its data
    Parameters (form-data):
        * number (integer):  Pokedex number
        * name (string): Pokemon name
        * type1 (string): Pokemon's first type
        * type2 (string): Pokemon's second type
        * total (integer): Sum of base stats
        * hp (integer): HP base stat
        * attack (integer): Attack base stat
        * defense (integer): Defense base stat
        * spatk (integer): Sp. Atk. base stat
        * spdef (integer): Sp. Def. base stat
        * speed (integer): Speed base stat
        * generation (integer): Generation the Pokemon belongs to
        * legendary (boolean): The Pokemon is legendary (true) or not (false)

-> PATCH /pokemon/{id}
    Description: updates a Pokemon in the database and shows its data
    Parameters (uri):
        * id: the database ID of the Pokemon to update. Error will be thrown if the ID does not exist in the database.
    Parameters (form-data): same as POST

-> DELETE /pokemon/{id}
    Description: deletes a Pokemon in the database and returns the resulting list
    Parameters (uri):
        * id: the database ID of the Pokemon to delete. Error will be thrown if the ID does not exist in the database.


-- TESTS

* Model test:
ruby test/models/pokemon_test.rb

* Controller test:
ruby test/controllers/pokemons_controller_test.rb