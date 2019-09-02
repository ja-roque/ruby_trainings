class TrainingsController < ApplicationController
  def new
    @header_title = 'Training Maker'
    @training = Training.new
  end

  def create
    @training = Training.new(name: params[:training][:name], company: current_user.company)
    if @training.valid?
      # contact_email and to_h methods
      # left as an exercise to the reader
      redirect_to root_url, notice: 'Email sent!'
    else
      render :new
    end
  end
end
