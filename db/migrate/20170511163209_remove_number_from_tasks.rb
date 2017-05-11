class RemoveNumberFromTasks < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :number, :integer
  end
end
