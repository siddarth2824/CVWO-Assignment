class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :item
      t.text :description
      t.datetime :due

      t.timestamps
    end
  end
end
