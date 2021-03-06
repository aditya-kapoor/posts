class PostTagResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :post_id, :integer
  attribute :tag_id, :integer

  # Direct associations

  belongs_to :tag

  belongs_to :post

  # Indirect associations
end
