class CreateTaskComments < ActiveRecord::Migration
  def change
    create_table :task_comments do |t|
      t.text :content
      t.reply :
      t.integer :task_id
      t.integer :usuario_id

      t.timestamps
    end
  end
end
