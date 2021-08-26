class CreateProjectPhases < ActiveRecord::Migration[6.1]
  def change
    create_table :project_phases do |t|
      t.string :name
      t.text :description
      t.date :initial_date
      t.date :end_date
      t.timestamps
    end
    add_reference :project_phases, :projects, foreign_key:true
  end
end
