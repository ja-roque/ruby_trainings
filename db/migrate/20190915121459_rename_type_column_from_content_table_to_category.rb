class RenameTypeColumnFromContentTableToCategory < ActiveRecord::Migration[5.2]
  def change
    rename_column :contents, :type, :category
  end
end
