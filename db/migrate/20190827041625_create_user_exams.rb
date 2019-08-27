class CreateUserExams < ActiveRecord::Migration[5.2]
  def change
    create_table :user_exams do |t|
      t.integer :score
      t.integer :attempts
      t.integer :time
      t.references :exam, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
