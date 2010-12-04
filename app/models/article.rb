class Article < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :title, :presence => true
  validates :body , :presence => true

  def long_title
    return "#{title} - #{published_at}"
  end
end
