require 'rails_helper'

RSpec.describe PostTagResource, type: :resource do
  describe 'serialization' do
    let!(:post_tag) { create(:post_tag) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(post_tag.id)
      expect(data.jsonapi_type).to eq('post_tags')
    end
  end

  describe 'filtering' do
    let!(:post_tag1) { create(:post_tag) }
    let!(:post_tag2) { create(:post_tag) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: post_tag2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([post_tag2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:post_tag1) { create(:post_tag) }
      let!(:post_tag2) { create(:post_tag) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            post_tag1.id,
            post_tag2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            post_tag2.id,
            post_tag1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
