class AddStatusToTests < ActiveRecord::Migration[8.0]
  def change
    add_column :tests, :status, :string
  end
end
