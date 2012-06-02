class Post
  include Mongoid::Document
  field :content, type: String
  field :created_at, type: Time

  embedded_in :topic

  belongs_to :user

  paginates_per 10

  validates_presence_of :content
end
