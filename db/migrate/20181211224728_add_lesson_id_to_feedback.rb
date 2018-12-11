class AddLessonIdToFeedback < ActiveRecord::Migration[5.2]
  def change
    add_column :feedback, :grouped_lesson_id, :uuid, null: true
  end
end
