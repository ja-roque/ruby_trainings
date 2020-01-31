class AddContentToSlideTexts < ActiveRecord::Migration[6.0]
  def change
    add_column :slide_texts, :content, :text
  end
end
