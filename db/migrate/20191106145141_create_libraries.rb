class CreateLibraries < ActiveRecord::Migration[6.0]
  def change
    create_table :libraries do |t|
      t.belongs_to :book
      t.belongs_to :user

      t.timestamps
    end
  end
end
