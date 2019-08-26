class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :slug
      t.string :telephone
      t.string :address
      t.string :logo_url
      t.string :website_url

      t.timestamps
    end
  end
end
