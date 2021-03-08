class ChangeUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column(:users, :gid, :fb_id)
  end
end
