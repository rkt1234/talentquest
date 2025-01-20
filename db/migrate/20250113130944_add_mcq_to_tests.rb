class AddMcqToTests < ActiveRecord::Migration[8.0]
  def change
    add_column :tests, :mcq, :jsonb, default: [], null: false
  end
end
