class AddStudentIdToMigration < ActiveRecord::Migration
  def change
    add_column :articles, :student_id, :integer
  end
end
