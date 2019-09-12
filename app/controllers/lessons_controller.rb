class LessonsController < ApplicationController
  def new
    @wat = 'hoy si papu'
  end

  def lesson_info
    @lesson = Lesson.find_by_id params[:lesson_id]

  end
end

