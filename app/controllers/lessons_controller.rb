class LessonsController < ApplicationController
  def new
    @wat = 'hoy si papu'
  end

  def lesson_info
    @lesson = Lesson.find_by_id params[:lesson_id]

  end

  def create
    @lesson = Lesson.new(name: params[:lesson_name], training_id: params[:training_id])
    if @lesson.valid?

      @lesson.save
      redirect_to training_editor_path 200, training_id: @lesson.training_id
    else
      render :new
    end
  end
end

