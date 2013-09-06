class CreateProjectsUsuarios < ActiveRecord::Migration
  def change
    create_table :projects_usuarios, :id => false do |t|
    	t.integer :project_id
      	t.integer :usuario_id
    end
  end
end
