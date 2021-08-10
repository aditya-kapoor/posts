class Tag < ApplicationRecord
  # Direct associations

  has_many   :post_tags,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end
end
