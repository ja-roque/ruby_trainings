class Slideshow < ApplicationRecord
  belongs_to :content, optional: true
  has_many :slides

  before_create :generate_name

  mount_uploader :bucket_url, SlideshowUploader
  serialize :bucket_url, JSON

  def download_slideshow
    Down.download bucket_url.url
  end

  def to_pdf
    downloaded_slideshow = download_slideshow
    output_path = "#{Rails.root}/ppt/#{name || downloaded_slideshow.original_filename}/pdf"
    Docsplit.extract_pdf downloaded_slideshow.to_path, output: output_path
    Dir["#{output_path}/*.pdf"].first
  end

  def split_to_jpgs
    pdf_path = to_pdf
    output_path = "#{pdf_path.split('/')[0...-1].join('/').to_s}/jpgs"
    Docsplit.extract_images pdf_path, :size => '1000x', :format => [:jpg], :output => output_path
    output_path
  end

  def generate_slides_from_jpg_dir(jpg_dir)
    jpg_paths = Dir["#{jpg_dir}/*.jpg"]

    jpg_paths.each do |jpg|
      image_file = File.open jpg
      slides.create img_url: image_file
      image_file.close
    end
  end

  private

  def generate_name
    # We navigate our way to the mount_uploader's file name without extension
    self.name = get_unique_name bucket_url.file.path.split('/').last.split('.').first
  end

  def get_unique_name(filename)
    name = filename.parameterize
    similar_names = Slideshow.where('name ILIKE ?', "#{name}%")

    similar_names = similar_names.pluck(:name).each_with_object({}) { |found_name,hash| hash[found_name] = true }

    count = 0
    base_name = name
    begin
      name = base_name
      name += "-#{count + 1}" if count > 0
      count += 1
    end while similar_names[name]

    name
  end

end