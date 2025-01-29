class AddDetailsToTests < ActiveRecord::Migration[8.0]
  def change
    add_column :tests, :full_marks, :integer
    add_column :tests, :duration, :string
    add_column :tests, :ongoing_status, :string
    add_column :tests, :marks_obtained, :integer
  end
end
