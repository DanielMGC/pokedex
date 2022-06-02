class PokemonsController < ApplicationController
    def index
        @offset = nil
        @limit = nil
        if(params[:page_size])
            @limit = params[:page_size].to_i
            if(params[:page])
                @offset = @limit * (params[:page].to_i - 1)
            end
        end
        @pokemons = Pokemon.limit(@limit).offset(@offset)
        render json: @pokemons
    end 

    def show
        @pokemon = Pokemon.find(params[:id])
        render json: @pokemon
    end 

    def create
        @pokemon = Pokemon.create(
            number: params[:number],
            name: params[:name],
            type1: params[:type1],
            type2: params[:type2],
            total: params[:total],
            hp: params[:hp],
            attack: params[:attack],
            defense: params[:defense],
            spatk: params[:spatk],
            spdef: params[:spdef],
            speed: params[:speed],
            generation: params[:generation],
            legendary: params[:legendary]
        )
        render json: @pokemon
    end 

    def update
        @pokemon = Pokemon.find(params[:id])
        @pokemon.update(
            number: params[:number],
            name: params[:name],
            type1: params[:type1],
            type2: params[:type2],
            total: params[:total],
            hp: params[:hp],
            attack: params[:attack],
            defense: params[:defense],
            spatk: params[:spatk],
            spdef: params[:spdef],
            speed: params[:speed],
            generation: params[:generation],
            legendary: params[:legendary]
        )
        render json: @pokemon
    end 

    def destroy
        @pokemons = Pokemon.all 
        @pokemon = Pokemon.find(params[:id])
        @pokemon.destroy
        render json: @pokemons
    end 

end