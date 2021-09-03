class Project::Team < ApplicationRecord
    belongs_to :user, foreign_key: 'users_id' 
    belongs_to :project, foreign_key: 'projects_id'
    #validates :user, uniqueness: { scope: :project, message: 'Must be unique for the same team'}
end
