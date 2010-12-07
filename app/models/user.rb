class User < ActiveRecord::Base
  has_one  :profile
  has_many :articles, :order => "published_at DESC, title ASC", :dependent => :nullify
  has_many :replies, :through => :articles, :source => :comments

  validates :email, :uniqueness => true, :length => {:within => 5..50}
end
