class CreateUserNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_notes do |t|
      t.text :note
      t.timestamps
    end
    add_reference :user_notes, :users, foreign_key:true
    add_reference :user_notes, :project_phase_milestones, foreign_key:true
  end
end
