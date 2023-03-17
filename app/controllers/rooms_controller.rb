class RoomsController < ApplicationController
  before_action :load_room, only: %i[show edit update destroy]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    @room = Room.create(room_params)

    if @room.save
      redirect_to @room, success: t('.success')
    else
      render :new
    end
  end

  def update
    if @room.update(room_params)
      redirect_to @room
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path
  end

  private

  def load_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:title, :description)
  end
end
