class CreateProjectPhaseMilestones < ActiveRecord::Migration[6.1]
  def change
    create_table :project_phase_milestones do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
    add_reference :project_phase_milestones, :project_phases, foreign_key: true
  end
end
