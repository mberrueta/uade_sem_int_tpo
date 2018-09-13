class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.integer :academic_calendar_id, required: true
      t.integer :max_students, required: true
      t.string :name, required: true
      t.timestamps
    end
  end
end
