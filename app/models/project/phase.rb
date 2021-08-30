class Project::Phase < ApplicationRecord
    belongs_to :project, foreign_key: 'projects_id'
    has_many :project_phase_activity, dependent: :delete_all, class_name: 'Project::Phase::Activity', foreign_key: 'project_phases_id'
    has_many :project_phase_milestone, dependent: :delete_all, class_name: 'Project::Phase::Milestone', foreign_key: 'project_phases_id'
    validates :name, presence: true, allow_blank: false
    validates :description, presence: true, allow_blank: false
    validates :start_date, presence: true, allow_blank: false
    validates :end_date, presence: true, allow_blank: false
end
