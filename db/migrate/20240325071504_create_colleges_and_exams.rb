class CreateCollegesAndExams < ActiveRecord::Migration[7.0]
  def change
    create_table :colleges do |t|
      t.string :name
      t.timestamps
    end

    create_table :exams do |t|
      t.string :name
      t.timestamps
    end

    create_table :colleges_exams, id: false do |t|
      t.belongs_to :college
      t.belongs_to :exam
    end
  end
end
