class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds, only: [:id, :name, :species]
    # except: [:created_at, :updated_at]
  end

  def show
    @bird = Bird.find_by(params[:id])
    if @bird
      render json: @bird.slice(:id, :name, :species)
    else
      render json: {message: "Bird not Found"}
    end
  end 

end