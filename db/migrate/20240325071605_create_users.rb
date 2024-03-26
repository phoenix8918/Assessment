class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_no
      t.belongs_to :college, null: false, foreign_key: true

      t.timestamps
    end
  end
end
