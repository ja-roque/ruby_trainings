class CreateSlideLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :slide_links do |t|
      t.string :link_url
      t.references :slide, foreign_key: true

      t.timestamps
    end
  end
end
