class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name, required: true
      t.string :phone, required: true
      t.string :address, required: true
      t.string :email
      t.string :web_page
      t.string :logo
      t.string :organization_type
      t.timestamps
    end
  end
end
