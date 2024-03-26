class AddExamWindowsToExams < ActiveRecord::Migration[7.0]
    def change
      add_belongs_to :exams, :exam_window
    end
end
