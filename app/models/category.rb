class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :nullify
    validates :name, presence: true, uniqueness: true
end
