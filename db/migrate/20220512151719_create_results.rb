class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.string :usn
      t.string :course_code
      t.integer :cee_obtained
      t.integer :see_obtained
      t.string :references
      t.string :students
      t.string :referencescourses

      t.timestamps
    end
  end
end
