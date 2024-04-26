class Tag < ApplicationRecord
    has_many :post_tags
    has_many :posts, through: :post_tags

    validates :name, presence: { message: 'is needed for a tag.' }, uniqueness: { message: "must stand out; this one's already in the crowd." }
end