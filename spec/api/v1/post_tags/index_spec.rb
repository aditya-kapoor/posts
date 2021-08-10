require "rails_helper"

RSpec.describe "post_tags#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/post_tags", params: params
  end

  describe "basic fetch" do
    let!(:post_tag1) { create(:post_tag) }
    let!(:post_tag2) { create(:post_tag) }

    it "works" do
      expect(PostTagResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["post_tags"])
      expect(d.map(&:id)).to match_array([post_tag1.id, post_tag2.id])
    end
  end
end
