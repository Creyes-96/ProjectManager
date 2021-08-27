class User::Note < ApplicationRecord
    belongs_to :user, foreign_key: 'users_id'
    belongs_to :project_phase_milestone, foreign_key: 'project_phases_milestones_id', class_name: 'Project::Phase'  
end
