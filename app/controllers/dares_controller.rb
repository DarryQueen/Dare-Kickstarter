class DaresController < ApplicationController
  def new
    @dare = Dare.new
  end

  def create
    @dare = Dare.new(dare_params)
    @dare.creator = current_user

    @dare.save
    if @dare.save
      redirect_to @dare
    else
      render 'new'
    end
  end

  def index
  end

  private
  def dare_params
    params.require(:dare).permit(:title, :description)
  end
end
