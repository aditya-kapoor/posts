class Post < ApplicationRecord
  enum status: { "draft" => 0, "published" => 1, "discarded" => 2,
                 "archived" => 3 }

  # Direct associations

  has_many   :post_tags,
             dependent: :destroy

  belongs_to :user,
             optional: true

  # Indirect associations

  has_many   :tags,
             through: :post_tags,
             source: :tag

  # Validations

  # Scopes

  def to_s
    published_at
  end
end
