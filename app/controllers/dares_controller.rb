class DaresController < ApplicationController
  def new
    @dare = Dare.new
  end

  def create
    subject = User.find_by_email(params[:subject_email])
    @dare = Dare.new(:title => params[:title], :description => params[:description], :creator => current_user, :subject => subject)

    @dare.save
    if @dare.save
      redirect_to @dare
    else
      render 'new'
    end
  end

  def index
  end
end
