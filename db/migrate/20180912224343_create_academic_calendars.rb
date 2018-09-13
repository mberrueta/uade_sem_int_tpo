class CreateAcademicCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :academic_calendars do |t|
      t.integer :organization_id, required: true
      t.integer :year, required: true
      t.string :calendar_type, required: true
      t.timestamps
    end
  end
end
