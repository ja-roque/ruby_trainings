class CreateContents < ActiveRecord::Migration[5.2]
  def change
    create_table :contents do |t|
      t.string :name
      t.string :type
      t.integer :difficulty
      t.integer :order
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
