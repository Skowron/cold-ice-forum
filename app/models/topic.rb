class Topic
  include Mongoid::Document
  field :title, type: String
  field :created_at, type: Time

  embeds_many :posts

  belongs_to :user

  attr_accessor :first_post_content

  def participating
    posts.collect{ |p| p.user }.uniq
  end

  accepts_nested_attributes_for :posts

  paginates_per 15

  validates_length_of :title, minimum: 3, maximum: 100
end
