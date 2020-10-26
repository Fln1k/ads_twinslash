class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.string :name
      t.text :description
      t.integer :state
      t.belongs_to :ads_type, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
