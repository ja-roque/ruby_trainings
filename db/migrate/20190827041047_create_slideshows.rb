class CreateSlideshows < ActiveRecord::Migration[5.2]
  def change
    create_table :slideshows do |t|
      t.string :name
      t.string :bucket_url
      t.string :info_link
      t.references :content_data, foreign_key: true

      t.timestamps
    end
  end
end
