class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :name
      t.string :type
      t.string :difficulty
      t.integer :sequence
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
