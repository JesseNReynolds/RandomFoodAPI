class CreatePastResults < ActiveRecord::Migration[6.1]
  def change
    create_table :past_results do |t|
      t.integer :user_id
      t.string :yelp_id
      t.string :rating
      t.string :restaurant_name

      t.timestamps
    end
  end
end
