class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.references :training, foreign_key: true

      t.timestamps
    end
  end
end
