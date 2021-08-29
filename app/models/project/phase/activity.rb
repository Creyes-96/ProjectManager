class Project::Phase::Activity < ApplicationRecord
    belongs_to :project_phase, foreign_key: 'project_phases_id', class_name: 'Project::Phase'
    validates :name, presence: true, allow_blank: false
    validates :description, presence: true, allow_blank: false
    validates :start_date, presence: true, allow_blank: false
    validates :end_date, presence: true, allow_blank: false
end
