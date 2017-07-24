require "rails_helper"

RSpec.describe ItemsController, type: :controller do

  describe "GET #index" do
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
        expect(RakutenWebService::Ichiba::Item).to receive(:search).with(keyword: keyword, imageFlag: 1).and_return(items)

        get :index, keyword: keyword
      end

      it "should return http success" do
        expect(response).to have_http_status(:success)
      end
      it "should assign returned 10 objects as items" do
        expect(assigns[:items]).to be_eql(items)
      end
    end
  end
end