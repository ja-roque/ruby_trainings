class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.integer :min_score
      t.integer :time_limit
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
