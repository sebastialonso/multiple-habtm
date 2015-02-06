class CreateFences < ActiveRecord::Migration
  def change
    create_table :fences do |t|
      t.string :name
      t.string :identifier

      t.timestamps null: false
    end
  end
end
