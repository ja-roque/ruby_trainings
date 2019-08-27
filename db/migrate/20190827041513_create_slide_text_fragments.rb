class CreateSlideTextFragments < ActiveRecord::Migration[5.2]
  def change
    create_table :slide_text_fragments do |t|
      t.string :text
      t.integer :order
      t.references :slide_text, foreign_key: true

      t.timestamps
    end
  end
end
