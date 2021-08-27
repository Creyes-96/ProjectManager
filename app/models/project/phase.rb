class Project::Phase < ApplicationRecord
    belongs_to :project, foreign_key: 'projects_id'
end
