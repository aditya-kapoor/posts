class User < ApplicationRecord
  # Direct associations

  has_many   :posts,
             -> { not_draft },
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end
end
