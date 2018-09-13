class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.integer :course_id, required: true
      t.string :name, required: true
      t.timestamps
    end
  end
end
