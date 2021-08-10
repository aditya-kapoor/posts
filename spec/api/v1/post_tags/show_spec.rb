require 'rails_helper'

RSpec.describe "post_tags#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/post_tags/#{post_tag.id}", params: params
  end

  describe 'basic fetch' do
    let!(:post_tag) { create(:post_tag) }

    it 'works' do
      expect(PostTagResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('post_tags')
      expect(d.id).to eq(post_tag.id)
    end
  end
end
