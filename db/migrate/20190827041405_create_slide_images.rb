class CreateSlideImages < ActiveRecord::Migration[5.2]
  def change
    create_table :slide_images do |t|
      t.string :img_url
      t.references :slide, foreign_key: true

      t.timestamps
    end
  end
end
