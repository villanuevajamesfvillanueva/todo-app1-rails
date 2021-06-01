class Task < ApplicationRecord
    belongs_to :category, optional: true

    validates :title, presence: true, uniqueness: true
    validates :body, presence: true
    validates :deadline, presence: true
end
