class Post < ApplicationRecord
    belongs_to :user
    validates_presence_of :title, :body, :adress, :category
    has_many :comments
    scope :published, -> { where(published_at: nil).or(where("published_at <= ?", DateTime.now)) }
    has_rich_text :body
    belongs_to :category
    belongs_to :city
end
