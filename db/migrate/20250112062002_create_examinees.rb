class CreateExaminees < ActiveRecord::Migration[8.0]
  def change
    create_table :examinees do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
    add_index :examinees, :email, unique: true
  end
end
