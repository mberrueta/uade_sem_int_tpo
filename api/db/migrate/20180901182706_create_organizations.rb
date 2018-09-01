class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name, required: true
      t.string :phone
      t.string :address
      t.string :page
      t.timestamps
    end
  end
end
