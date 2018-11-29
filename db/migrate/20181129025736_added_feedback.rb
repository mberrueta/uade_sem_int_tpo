class AddedFeedback < ActiveRecord::Migration[5.2]
  def change
    create_table :feedback, id: :uuid  do |t|
      t.uuid :student_id, index: true
      t.uuid :to_id
      t.string :to_type
      t.integer :value, required: true
      t.string :comments
      t.boolean :viewed, default: false
      t.timestamps
    end
    add_foreign_key :feedback, :people, column: :student_id
  end
end
