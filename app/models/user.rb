class User < ApplicationRecord
    has_many :posts

    validates :name, presence: { message: "Must be provided and cannot be blank." }
    validates :email, presence: { message: "Is required to create a user profile." }, 
                    uniqueness: { case_sensitive: false, message: "Is already in use by another account." },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be a valid email address." }
    validates :password, presence: { message: "Is required for security reasons." },
                    lenght: {minimum: 6, message: "Must be at least 6 characters long."}

    private
        def def normalize_name
            self.name = name.titleize
        end
        def remove_whitespaces
            self.name = name.strip
        end
        def downcase_email
            self.email = email.downcase
        end
end