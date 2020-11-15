require 'rails_helper'

RSpec.describe "Content API", :type => :request do
  describe "GET /contents" do
    let!(:content) { FactoryBot.create(:content, status: "published") }

    before(:each) { get "/contents"}

    it "returns a json response" do
      json = JSON.parse(response.body)
      expect(json["data"]).not_to be_empty
    end

    it "responds with a valid data" do
      json = JSON.parse(response.body)
      attributes = json["data"].first["attributes"]
      expect(attributes["content"]).to eq content.content
      expect(attributes["author"]).to eq content.author
      expect(attributes["summary"]).to eq content.summary
      expect(Date.parse(attributes["published_date"])).to eq content.published_date
    end

    it "responds with valid json api format" do
      expect(response.headers["Content-Type"]).to eq "application/vnd.api+json"
    end
  end

  describe "GET /contents/:id" do
    let!(:content) { FactoryBot.create(:content, status: "published") }

    before(:each) { get "/contents/#{content.id}"}

    it "responds with valid json api format" do
      expect(response.headers["Content-Type"]).to eq "application/vnd.api+json"
    end

    it "responds with the requested content" do
      json = JSON.parse(response.body)
      attributes = json["data"]["attributes"]
      expect(attributes["content"]).to eq content.content
      expect(attributes["author"]).to eq content.author
      expect(attributes["summary"]).to eq content.summary
      expect(Date.parse(attributes["published_date"])).to eq content.published_date
    end

  end
end
