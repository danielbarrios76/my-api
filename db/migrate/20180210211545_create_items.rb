class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :state
      t.string :name
      t.text :description
      t.float :initial_bid
      t.references :user, foreign_key: true
      t.string :photo
      t.datetime :finish_at

      t.timestamps
    end
  end
end
