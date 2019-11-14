class ContentsController < ApplicationController
  def create
    training = current_user.company.trainings.find params[:training_id]
    @lesson = training.lessons.find params[:lesson_id]

    if @lesson
      @lesson.contents.create({name: params[:name], category: params[:category] })
      # @lesson.contents.save
      redirect_to training_editor_path 200, training_id: @lesson.training_id
    else
      render :new
    end
  end

  def content_info
    training = current_user.company.trainings.find params[:training_id]
    @lesson = training.lessons.find params[:lesson_id]
    @content = @lesson.contents.find params[:content_id]
    @slideshow = @content.slideshows.new
  end

  def upload_ppt
    puts allowed_params
    @slideshow = Slideshow.create!(allowed_params)
  end

  def allowed_params
    params.require(:slideshow).permit(:bucket_url)
  end
end
