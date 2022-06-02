require "./test/test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
    test "should list all pokemon" do
        get '/pokemon'
        assert_response :success
        list = JSON.parse(@response.body)
        assert_equal 2, list.length
    end

    test "should paginate pokemon" do
        get '/pokemon?page=2&page_size=1'
        assert_response :success
        list = JSON.parse(@response.body)
        assert_equal 1, list.length
        assert_equal 2, list[0]["number"]
    end

    test "should return empty list if pagination out of bounds" do
        get '/pokemon?page=5&page_size=1'
        assert_response :success
        list = JSON.parse(@response.body)
        assert_equal 0, list.length
    end

    test "should get pokemon by id" do
        get '/pokemon/1'
        assert_response :success
        pokemon = JSON.parse(@response.body)
        assert_equal 1, pokemon["number"]
    end

    test "should return error if id does not exist" do
        exception = assert_raise(ActiveRecord::RecordNotFound) {
            get '/pokemon/5'
        }
        assert_equal "Couldn't find Pokemon with 'id'=5", exception.message
    end

    test "should create new pokemon" do
        post "/pokemon",
            params: { number: 3, name: "Pokemon Three" }
        assert_response :success
        pokemon = JSON.parse(@response.body)
        assert_equal 3, pokemon["number"]

        get '/pokemon'
        list = JSON.parse(@response.body)
        assert_equal 3, list.length
    end

    test "should update pokemon" do
        patch "/pokemon/2",
            params: { number: 22, name: "Pokemon Twenty Two" }
        assert_response :success

        get '/pokemon/2'
        pokemon = JSON.parse(@response.body)
        assert_equal 22, pokemon["number"]
    end

    test "should return error if trying to update with id that does not exist" do
        exception = assert_raise(ActiveRecord::RecordNotFound) {
            patch "/pokemon/5",
                params: { number: 55 }
        }
        assert_equal "Couldn't find Pokemon with 'id'=5", exception.message
    end

    test "should delete pokemon" do
        delete "/pokemon/2"
        assert_response :success
        list = JSON.parse(@response.body)
        assert_equal 1, list.length
    end

    test "should return error if trying to delete with id that does not exist" do
        exception = assert_raise(ActiveRecord::RecordNotFound) {
            delete "/pokemon/5"
        }
        assert_equal "Couldn't find Pokemon with 'id'=5", exception.message
    end
end
