# frozen_string_literal: true
require "rails_helper"

RSpec.describe ItemsController, type: :controller do

  describe "GET #index" do
    let(:genre) { create(:rws_ichiba_genre, :root, children: []) }

    before do
      allow(RWS::Ichiba::Genre).to receive(:root).and_return(genre)
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "should assigns items as an empty array" do
      get :index

      expect(assigns[:items]).to be_empty
    end

    context "When given keyword" do
      let(:keyword) { "ruby" }
      let(:items) { create_list(:rws_ichiba_item, 10) }

      before do
        expect(RakutenWebService::Ichiba::Item).to receive(:search).
          with(keyword: keyword, genre_id: genre.id, imageFlag: 1).
          and_return(items)

        get :index, keyword: keyword
      end

      it "should return http success" do
        expect(response).to have_http_status(:success)
      end
      it "should assign returned 10 objects as items" do
        expect(assigns[:items]).to be_eql(items)
      end
      it "should assign the given keyword as @keyword" do
        expect(assigns[:keyword]).to be_eql(keyword)
      end
    end

    context "When given genre_id" do
      let(:genre) { create(:rws_ichiba_genre, children: []) }
      let(:keyword) { "foo" }
      let(:items) { create_list(:rws_ichiba_item, 10) }

      before do
        expect(RakutenWebService::Ichiba::Item).to receive(:search).
          with(keyword: keyword, genre_id: genre.id, imageFlag: 1).
          and_return(items)
        expect(RakutenWebService::Ichiba::Genre).to receive(:new).
          with(genre.id.to_s).
          and_return(genre)
      end

      it "should return http success" do
        get :index, keyword: keyword, genre_id: genre.id

        expect(response).to have_http_status(:success)
      end
    end
  end
end
