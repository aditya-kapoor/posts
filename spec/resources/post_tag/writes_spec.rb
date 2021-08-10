require 'rails_helper'

RSpec.describe PostTagResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'post_tags',
          attributes: attributes_for(:post_tag)
        }
      }
    end

    let(:instance) do
      PostTagResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { PostTag.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:post_tag) { create(:post_tag) }

    let(:payload) do
      {
        data: {
          id: post_tag.id.to_s,
          type: 'post_tags',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      PostTagResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { post_tag.reload.updated_at }
      # .and change { post_tag.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:post_tag) { create(:post_tag) }

    let(:instance) do
      PostTagResource.find(id: post_tag.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { PostTag.count }.by(-1)
    end
  end
end
