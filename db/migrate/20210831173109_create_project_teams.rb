class CreateProjectTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :project_teams do |t|

      t.timestamps
    end
    add_reference :project_teams, :users, foreign_key:true
    add_reference :project_teams, :projects, foreign_key:true
  end
end
