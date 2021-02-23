class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :gid
      t.string :settings_obj

      t.timestamps
    end
  end
end
