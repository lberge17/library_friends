class CreateRecommendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommendations do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.text :comment

      t.timestamps
    end
  end
end
