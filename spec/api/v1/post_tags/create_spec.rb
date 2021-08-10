require "rails_helper"

RSpec.describe "post_tags#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/post_tags", payload
  end

  describe "basic create" do
    let(:params) do
      attributes_for(:post_tag)
    end
    let(:payload) do
      {
        data: {
          type: "post_tags",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(PostTagResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { PostTag.count }.by(1)
    end
  end
end
