class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.string :usn
      t.string :course_code
      t.integer :cee_obtained
      t.integer :see_obatined
      t.references :students, null: false, foreign_key: true
      t.references :courses, null: false, foreign_key: true

      t.timestamps
    end
  end
end
