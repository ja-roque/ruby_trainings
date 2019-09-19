class RemoveContentDataRelationship < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :slideshows, :content_data
  end
end
