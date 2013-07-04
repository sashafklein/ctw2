class BoxesController < ApplicationController
  def index
    @boxes = Box.all
  end

  def new
    @box = Box.new
    @location = @box.build_location
  end

  def create
    @box = Box.new(params[:box])
    if @box.save!
      redirect_to @box
    else
      redirect_to root_path
    end
  end

  def show
    @box = Box.find(params[:id])
  end

  def edit
    @box = Box.new
    @location = @box.location ? @box.location : @box.build_location
  end

  def update
    @box = Box.find(params[:id])
    if @box.update_attributes(params[:box])
      redirect_to @box
    else
      redirect_to root_path
    end
  end

  def destroy
  end
end
