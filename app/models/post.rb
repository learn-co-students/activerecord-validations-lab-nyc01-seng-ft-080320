class Post < ActiveRecord::Base

    @clickbait_title_array = ["Won't Believe", "Secret", "Top", "Guess"]

    validates :title, presence: true
    validate :title, :clickbaity
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validates :title, presence: true
  
  
  
  
    def clickbaity
      if !title
        errors.add(:title, "Post needs a title")
      elsif title.exclude?("Won't Believe" || "Secret" || "Top" || "Guess")
        errors.add(:title, "not clickbait-y enough")
      end
    end
end
