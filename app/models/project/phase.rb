class Project::Phase < ApplicationRecord
    belongs_to :project, foreign_key: 'projects_id'
    validates :name, presence: true, allow_blank: false
    validates :description, presence: true, allow_blank: false
    validates :start_date, presence: true, allow_blank: false
    validates :end_date, presence: true, allow_blank: false
end
