class RemoveMarksObtainedFromTests < ActiveRecord::Migration[8.0]
  def change
    remove_column :tests, :marks_obtained, :integer
  end
end
