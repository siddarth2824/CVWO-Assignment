class AddDueToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :due, :date
  end
end
