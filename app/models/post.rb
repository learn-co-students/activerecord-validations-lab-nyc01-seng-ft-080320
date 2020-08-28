class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length:{minimum: 250}
    validates :summary, length:{maximum: 250}
    validates :category, inclusion: %w(Fiction Non-Fiction)
    validate :click_baity?

    private
    def click_baity?
        if self.title && !self.title.match?(/Won't Believe|Secret|Top|Guess/)
            errors.add(:title, "Not click baity enough")
        end
    end
end
