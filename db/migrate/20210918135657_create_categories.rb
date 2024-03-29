class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, presence: true, uniqueness: true

      t.timestamps
    end
    add_index :categories, :name, unique: true
  end
end
