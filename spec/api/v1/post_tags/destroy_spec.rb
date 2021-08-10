require "rails_helper"

RSpec.describe "post_tags#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/post_tags/#{post_tag.id}"
  end

  describe "basic destroy" do
    let!(:post_tag) { create(:post_tag) }

    it "updates the resource" do
      expect(PostTagResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { PostTag.count }.by(-1)
      expect { post_tag.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
