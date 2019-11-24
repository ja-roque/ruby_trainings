class SlideshowUploader < CarrierWave::Uploader::Base

  storage :fog

  def store_dir
    "uploads/slideshows/#{model.id}"
  end

  def size_range
    1..100.megabytes
  end

  def extension_white_list
    %w(ppt pptx)
  end

end
