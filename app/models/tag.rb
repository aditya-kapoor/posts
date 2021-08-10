class Tag < ApplicationRecord
  # Direct associations

  has_many   :post_tags,
             dependent: :destroy

  # Indirect associations

  has_many   :posts,
             through: :post_tags,
             source: :post

  # Validations

  # Scopes

  def to_s
    name
  end
end
