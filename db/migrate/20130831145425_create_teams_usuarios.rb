class CreateTeamsUsuarios < ActiveRecord::Migration
  def change
    create_table :teams_usuarios, :id => false do |t|
    	t.integer :team_id
      	t.integer :usuario_id
    end
  end
end
