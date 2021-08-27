class Project::Phase::Milestone < ApplicationRecord
    belongs_to :project_phase, foreign_key: 'project_phases_id', class_name: 'Project::Phase'
end
