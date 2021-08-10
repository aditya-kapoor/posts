class PostResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :published_at, :datetime
  attribute :user_id, :integer
  attribute :title, :string
  attribute :html, :string
  attribute :status, :integer_enum, allow: Post.statuses.keys

  # Direct associations

  has_many   :post_tags

  belongs_to :user

  # Indirect associations

end
