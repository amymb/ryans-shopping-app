class ThingsController < ApplicationController
  def index
    @things = Thing.all
  end

  def new
    @thing = Thing.new
  end

  def create
    @thing = Thing.new(thing_params)
    if @thing.save
      redirect_to things_path
      flash[:notice] = "Item successfully added to your list!"
    else
      render :new
    end
  end

  def show
    @thing=Thing.find(params[:id])
  end

  def edit
    @thing =Thing.find(params[:id])
  end

  def update
    @thing=Thing.find(params[:id])
    if @thing.update(thing_params)
      redirect_to thing_path
    else
      render :edit
    end
  end

  def destroy
    thing=Thing.find(params[:id])
    thing.destroy
    redirect_to things_path
  end

private
  def thing_params
    params.require(:thing).permit(:item, :priority, :description, :estimated_cost)
  end


end
