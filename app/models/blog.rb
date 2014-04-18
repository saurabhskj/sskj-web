class Blog < ActiveRecord::Base
  attr_accessible :content, :title
  has_many :comments

  validates :title, presence: true,
            length: { minimum: 5 }
end
