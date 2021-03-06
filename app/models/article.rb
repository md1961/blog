class Article < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments

  validates :title, :presence => true
  validates :body , :presence => true

  scope :published  , where("articles.published_at IS NOT NULL")
  scope :draft      , where("articles.published_at IS     NULL")
  scope :recent     , lambda { published.where("articles.published_at > ?", 1.week.ago.to_date) }
  scope :where_title, lambda { |term| where("articles.title LIKE ?", "%#{term}%") }

  def published?
    return published_at.present?
  end

  def long_title
    return "#{title} - #{published_at}"
  end
end
