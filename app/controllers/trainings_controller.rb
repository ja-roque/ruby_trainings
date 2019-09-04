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
      @training.save
      redirect_to training_editor_path 200, training_id: @training.id
    else
      render :new
    end
  end

  def editor_menu
    @header_title = 'Trainings editor'
  end

  def editor
    company = current_user.company
    @training = company.trainings.find params[:training_id]
  end
end
