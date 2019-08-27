class CreateSlideTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :slide_texts do |t|
      t.string :title
      t.references :slide, foreign_key: true

      t.timestamps
    end
  end
end
