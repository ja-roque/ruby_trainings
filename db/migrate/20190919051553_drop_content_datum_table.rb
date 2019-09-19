class DropContentDatumTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :content_data
  end
end
