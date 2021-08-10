class PostTag < ApplicationRecord
  # Direct associations

  belongs_to :tag

  belongs_to :post

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    post.to_s
  end
end
