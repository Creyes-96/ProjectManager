class CreateProjectPhaseActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :project_phase_activities do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
    add_reference :project_phase_activities, :project_phases, foreign_key:true
  end
end
