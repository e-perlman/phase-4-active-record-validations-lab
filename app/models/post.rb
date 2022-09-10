class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum:250}
    validates :summary, length: {maximum:250}
    validates :category, inclusion: {in:["Fiction","Non-Fiction"]}

    validate :click_bait

    def click_bait
        titles=["Won't Believe", "Secret", "Top","Guess"].map {|word| word.downcase}
        if title
            if titles.none? {|word| title.downcase.include? word} 
                errors.add(:title, "isn't catchy enough")
            end
        end
    end

end
