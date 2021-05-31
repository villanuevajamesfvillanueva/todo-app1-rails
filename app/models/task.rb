class Task < ApplicationRecord
    belongs_to :category, optional: true

    validates :title, presence: true, uniqueness: true
    validates :body, presence: true, length: {minimum: 10}
    validates :deadline, presence: true
end
