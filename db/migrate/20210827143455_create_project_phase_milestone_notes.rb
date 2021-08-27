class CreateProjectPhaseMilestoneNotes < ActiveRecord::Migration[6.1]
    def change
        create_table :project_phase_milestone_notes do |t|
            t.string :note
            t.references :project_phase_milestones, foreign_key: true, 
            index: { name: "notes_index" }
            t.timestamps
        end
    
        add_reference :project_phase_milestone_notes, :users, foreign_key:true
    end
end
