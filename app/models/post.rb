class Post < ActiveRecord::Base
    CATS = ["Fiction", "Non-Fiction"]
    
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: CATS
    validate :is_clickbait?

    def is_clickbait?
        words= [/Won't Believe/, /Secret/, /Top [0-9]*/, /Guess/]
        if words.none? { |pat| pat.match(title) }
            errors.add(:title, "must be clickbait")
        end
    end
end
