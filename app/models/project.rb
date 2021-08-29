class Project < ApplicationRecord
    belongs_to :user, foreign_key: 'users_id' 
    validates :name, presence: true, allow_blank: false
    validates :description, presence: true, allow_blank: false
    validates :state, presence: true, allow_blank: false
    validates :start_date, presence: true, allow_blank: false
    validates :end_date, presence: true, allow_blank: false
end
