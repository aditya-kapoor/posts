require 'rails_helper'

RSpec.describe "post_tags#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/post_tags/#{post_tag.id}", payload
  end

  describe 'basic update' do
    let!(:post_tag) { create(:post_tag) }

    let(:payload) do
      {
        data: {
          id: post_tag.id.to_s,
          type: 'post_tags',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(PostTagResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { post_tag.reload.attributes }
    end
  end
end
