class RenamePasswordToPasswordDigestInExaminees < ActiveRecord::Migration[8.0]
  def change
    rename_column :examinees, :password, :password_digest
  end
end
