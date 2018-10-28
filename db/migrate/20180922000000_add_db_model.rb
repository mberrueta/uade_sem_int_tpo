class AddDbModel < ActiveRecord::Migration[5.2]
  def change

    # default: 'uuid_generate_v4()'

    create_table :organizations, id: :uuid  do |t|
      t.string :name, required: true
      t.string :phone, required: true
      t.string :address, required: true
      t.string :email
      t.string :web_page
      t.string :logo
      t.string :organization_type
      t.timestamps
    end

    create_table :academic_calendars, id: :uuid  do |t|
      t.uuid :organization_id, index: true
      t.integer :year, required: true
      t.string :calendar_type, required: true
      t.timestamps
    end
    add_foreign_key :academic_calendars, :organizations

    create_table :courses, id: :uuid  do |t|
      t.uuid :academic_calendar_id, index: true
      t.uuid :manager_id, index: true
      t.integer :max_students, required: true
      t.string :name, required: true
      t.string :classroom
      t.string :shift
      t.timestamps
    end
    add_foreign_key :courses, :academic_calendars

    create_table :subjects, id: :uuid  do |t|
      t.uuid :course_id, index: true
      t.string :name, required: true
      t.string :code, required: true
      t.string :day
      t.string :hour
      t.uuid :teacher_id, index: true
      t.timestamps
    end
    add_foreign_key :subjects, :courses

    create_table :people, id: :uuid  do |t|
      t.string :first_name, required: true
      t.string :last_name, required: true
      t.string :phone, required: true
      t.string :address, required: true
      t.string :email
      t.string :gender
      t.string :picture_url
      t.string :type
      t.string :student_ids, array: true, default: []
      t.uuid :course_id
      t.uuid :organization_id, index: true
      t.string :type, null: false
      t.timestamps
    end
    add_foreign_key :people, :organizations
    add_foreign_key :people, :courses
    add_foreign_key :courses, :people, column: :manager_id
    add_foreign_key :subjects, :people, column: :teacher_id

    create_table :exams, id: :uuid  do |t|
      t.string :title, required: true
      t.uuid :subject_id, index: true
      t.timestamps
    end
    add_foreign_key :exams, :subjects

    create_table :student_exams, id: :uuid  do |t|
      t.uuid :exam_id, index: true
      t.uuid :student_id, index: true
      t.integer :questions_to_show
      t.timestamps
    end
    add_foreign_key :student_exams, :people, column: :student_id
    add_foreign_key :student_exams, :exams

    create_table :student_answers, id: :uuid  do |t|
      t.uuid :student_exam_id, index: true
      t.string :answer_code
      t.boolean :correct
      t.timestamps
    end
    add_foreign_key :student_answers, :student_exams

    create_table :exam_questions, id: :uuid  do |t|
      t.uuid :exam_id, index: true
      t.string :question
      t.json :options, default: {}
      t.timestamps
    end
    add_foreign_key :exam_questions, :exams

    create_table :student_exam_qualifications, id: :uuid  do |t|
      t.uuid :student_exam_id, index: true
      t.float :result
      t.float :score
      t.string :notes
      t.timestamps
    end
    add_foreign_key :student_exam_qualifications, :student_exams

    create_table :qualification_reports, id: :uuid  do |t|
      t.uuid :student_id, index: true
      t.string :notes
      t.timestamps
    end
    add_foreign_key :qualification_reports, :people, column: :student_id

    create_table :qualification_report_subjects, id: :uuid  do |t|
      t.uuid :subject_id, index: true
      t.uuid :qualification_report_id, index: true
      t.integer :results, array: true, deafult: []
      t.string :notes
      t.timestamps
    end
    add_foreign_key :qualification_report_subjects, :subjects
    add_foreign_key :qualification_report_subjects, :qualification_reports

    create_table :assists, id: :uuid  do |t|
      t.uuid :student_id, index: true
      t.uuid :course_id, index: true
      t.date :date
      t.string :present_code
      t.timestamps
    end
    add_foreign_key :assists, :people, column: :student_id
    add_foreign_key :assists, :courses

    create_table :news, id: :uuid  do |t|
      t.uuid :organization_id, index: true
      t.string :title
      t.string :description
      t.boolean :sent
      t.uuid :newsable_id
      t.string  :newsable_type
      t.string :present_code
      t.timestamps
    end
    add_index :news, [:newsable_type, :newsable_id]
    add_foreign_key :news, :organizations

    create_table :programs, id: :uuid  do |t|
      t.uuid :subject_id, index: true
      t.date :date
      t.boolean :done, default: false
      t.integer :class_number
      t.string :title
      t.string :description
      t.string :picture_url
      t.timestamps
    end
    add_foreign_key :programs, :subjects

    create_table :topics, id: :uuid  do |t|
      t.uuid :program_id, index: true
      t.string :title
      t.string :description
      t.timestamps
    end
    add_foreign_key :topics, :programs
  end
end
