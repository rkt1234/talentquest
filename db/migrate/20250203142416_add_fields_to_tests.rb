class AddFieldsToTests < ActiveRecord::Migration[8.0]
  def change
    add_column :tests, :start_date, :string
    add_column :tests, :end_date, :string
    add_column :tests, :start_time, :string
    add_column :tests, :end_time, :string
    add_column :tests, :description, :string
  end
end
