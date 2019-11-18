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
    output_path = "#{Rails.root}/ppt/#{name || 'test'}/pdf"
    downloaded_slideshow = download_slideshow.to_path
    Docsplit.extract_pdf downloaded_slideshow, output: output_path
    Dir["#{output_path}/*.pdf"].first
  end

  def split_to_jpgs
    pdf_path = to_pdf
    Docsplit.extract_images pdf_path, :size => '1000x', :format => [:jpg], :output => "#{Rails.root}/ppt/#{name || 'test'}/jpgs"
  end

  private

  def generate_name
    # We navigate our way to the mount_uploader's file name without extension
    self.name = get_unique_slug bucket_url.file.path.split('/').last.split('.').first
  end

  def get_unique_slug(filename)
    name = filename.parameterize
    similar_slugs = Slideshow.where('name ILIKE ?', "#{name}%")

    similar_slugs = similar_slugs.pluck(:slug).each_with_object({}) { |found_slug,hash| hash[found_slug] = true }

    count = 0
    base_slug = slug
    begin
      slug = base_slug
      slug += "-#{count + 1}" if count > 0
      count += 1
    end while similar_slugs[slug]

    slug
  end

end