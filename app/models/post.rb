class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags
    has_many :tags, through: :post_tags

    validates :title, presence: { message: 'needs a title.' }
    validates :content, presence: { message: 'cannot be empty.' }
    validates :user, presence: true
    validates :answers_count, numericality: { greater_than_or_equal_to: 0 }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0 }
  
    before_create :set_default_published_at
  
    private
  
    def set_default_published_at
      self.published_at ||= Time.current
    end
end