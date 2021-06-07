class Task < ApplicationRecord
    belongs_to :category, optional: true

    validate :uniqueness_to_user
    # validate :unique_to_user
    validates :title, presence: true
    validates :body, presence: true
    validates :deadline, presence: true

    def uniqueness_to_user 
        sql = <<~SQL
            SELECT *
            FROM tasks, categories, users 
            WHERE categories.user_id = '#{User.current.id}' AND tasks.category_id = categories.id
            AND tasks.title = '#{title}'
        SQL

        records = ActiveRecord::Base.connection.exec_query(sql).to_a
        if (records.present? && new_record?)
            errors.add(:title, "already exists")    
        end
    end

    # def user
    #     category.user
    # end

    # def unique_to_user
    #     results = user.tasks.where(title: title)

    #     errors.add(:title, "already exists") if results.present?
    # end

end
