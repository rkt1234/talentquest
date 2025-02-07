class AddInstructionsToTests < ActiveRecord::Migration[8.0]
  def change
    add_column :tests, :instructions, :text
  end
end
