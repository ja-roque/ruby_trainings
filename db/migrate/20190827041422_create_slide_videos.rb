class CreateSlideVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :slide_videos do |t|
      t.string :video_url
      t.references :slide, foreign_key: true

      t.timestamps
    end
  end
end
