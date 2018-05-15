class PersonController < ApplicationController
  def new
  end

  def create
    if create_params[:director] == 'Director'
      @director = Director.new(create_params.permit(:first_name, :last_name, :birth_date, :description))
      respond_to do |format|
        if @director.save
          format.html { redirect_to @director, notice: 'Director was successfully created.' }
          format.json { render :show, status: :created, location: @director }
        else
          format.html { render :new }
          format.json { render json: @director.errors, status: :unprocessable_entity }
        end
      end
    else
      @actor = Actor.new(create_params.permit(:first_name, :last_name, :birth_date, :description))

      respond_to do |format|
        if @actor.save
          format.html { redirect_to @actor, notice: 'Actor was successfully created.' }
          format.json { render :show, status: :created, location: @actor }
        else
          format.html { render :new }
          format.json { render json: @actor.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def index
    if params[:q] == 'actor'
      redirect_to :controller => 'actors', action: 'index'
    elsif params[:q] == 'director'
      redirect_to :controller => 'directors', action: 'index'
    else
    end
  end

  private
    def create_params
      create_params = params.permit(:first_name, :last_name, :birth_date, :description, :director)
    end
end
