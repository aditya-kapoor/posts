require 'rails_helper'

RSpec.describe PostTag, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:tag) }

    it { should belong_to(:post) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
