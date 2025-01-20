class CreateTests < ActiveRecord::Migration[8.0]
  def change
    create_table :tests do |t|
      t.string :test_name
      t.string :organization_name
      t.jsonb :sections, default: []

      t.timestamps
    end
  end
end
