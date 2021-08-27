class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name 
      t.text :description
      t.string :state
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
