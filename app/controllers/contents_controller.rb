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
    @slideshow = @content.slideshows.first
    @new_slideshow = @content.slideshows.new
    @slide_text = SlideText.new
  end

  def upload_ppt
    puts allowed_params
    @slideshow = Slideshow.create!(allowed_params)
  end

  def split_ppt
    slideshow_to_split = Slideshow.find params[:slideshow_id]
    jpgs_path = slideshow_to_split.split_to_jpgs
    slideshow_to_split.generate_slides_from_jpg_dir jpgs_path

    redirect_to content_info_path
  end

  def submit_text_manager

  end

  def allowed_params
    params.require(:slideshow).permit(:bucket_url, :content_id)
  end
end
