class DropTestsTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :tests
  end
end
