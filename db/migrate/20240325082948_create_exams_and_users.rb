class CreateExamsAndUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :exams_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :exam
      t.timestamps
    end
  end
end
