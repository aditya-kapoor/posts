class Post < ApplicationRecord
  enum status: {"draft"=>0, "published"=>1, "discarded"=>2, "archived"=>3} 

  # Direct associations

  belongs_to :user,
             :required => false

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    published_at
  end

end