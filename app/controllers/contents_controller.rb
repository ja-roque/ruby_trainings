class ContentsController < ApplicationController
  def create
    training = current_user.company.trainings.find params[:training_id]
    @lesson = training.lessons.find params[:lesson_id]

    if @lesson
      @lesson.contents.create({name: params[:type_of_content].to_s})
      # @lesson.contents.save
      redirect_to training_editor_path 200, training_id: @lesson.training_id
    else
      render :new
    end
  end
end
