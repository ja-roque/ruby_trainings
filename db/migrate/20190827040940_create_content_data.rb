class CreateContentData < ActiveRecord::Migration[5.2]
  def change
    create_table :content_data do |t|
      t.references :content, foreign_key: true

      t.timestamps
    end
  end
end
