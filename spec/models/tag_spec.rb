require "rails_helper"

RSpec.describe Tag, type: :model do
  describe "Direct Associations" do
    it { should have_many(:post_tags) }
  end

  describe "InDirect Associations" do
    it { should have_many(:posts) }
  end

  describe "Validations" do
  end
end
