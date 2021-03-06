require "rails_helper"

RSpec.describe Post, type: :model do
  describe "Direct Associations" do
    it { should have_many(:post_tags) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
    it { should have_many(:tags) }
  end

  describe "Validations" do
  end
end
