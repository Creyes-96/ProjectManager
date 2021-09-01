class Project::Phase::Milestone < ApplicationRecord
    belongs_to :project_phase, foreign_key: 'project_phases_id', class_name: 'Project::Phase'
    has_many :project_phase_milestone_note, dependent: :destroy, class_name: 'Project::Phase::Milestone::Note', foreign_key: 'project_phase_milestones_id'
    validates :name, presence: true, allow_blank: false
    validates :description, presence: true, allow_blank: false
end
