class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|

      t.timestamps
    end
    add_reference :teams, :users, foreign_key:true
    add_reference :teams, :projects, foreign_key:true
  end
end
