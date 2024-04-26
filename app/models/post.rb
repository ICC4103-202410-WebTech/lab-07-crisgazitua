class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags

    validates :title, presence: {message: "Cannot be empty. Please provide a title for your post."}
    validates :content, presence: {message: "Cannot be blank. Your Post must contain content."}
    validates :user_id, presence: true
    validates :answers_count, numericality: {greater_than_or_equal_to: 0, message: "Must be a non-negative number." }
    validates :likes_count, numericality: {greater_than_or_equal_to: 0, message: "Must be a non-negative number."}

    private
        def default_published_at
            self.published_at = published_at.Time.current
        end
end