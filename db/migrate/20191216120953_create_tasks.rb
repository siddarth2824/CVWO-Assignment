class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :item
      t.text :description
      t.date :due
      t.boolean :complete, null: false, default: false
      t.belongs_to :user

      t.timestamps
    end
  end
end
