class Article < ActiveRecord::Base
  belongs_to :user

  validates :title, :presence => true
  validates :body , :presence => true

  def long_title
    return "#{title} - #{published_at}"
  end
end
