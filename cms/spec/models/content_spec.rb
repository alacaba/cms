require 'rails_helper'

RSpec.describe Content, type: :model do
  let (:content) { FactoryBot.build(:content, :published) }

  subject { content }

  it { respond_to(:content) }
  it { respond_to(:summary) }
  it { respond_to(:published_date) }
  it { respond_to(:author) }
  it { respond_to(:title) }

  it "creates a new content" do
    expect { subject.save }.to change { Content.count }
  end

  describe "#time_to_publish" do
    it "computes the time to publish" do
      content.published_date = Date.today + 1.day
      expect(content.time_to_publish).to eq 86400
    end
  end

  describe "#post!" do
    it "changes the attribute from draft to published" do
      content.status = "draft"
      content.save
      expect { content.post! }.to change { content.reload.status }.from("draft").to("published")
    end
  end

  describe "scopes" do
    let (:published) { FactoryBot.create(:content, :published) }
    let (:draft) { FactoryBot.create(:content, :draft) }

    context "default" do
      it "only returns contents that are status = published" do
        contents = Content.published
        expect(contents).not_to include(draft)
      end
    end

    context ".drafts" do
      it "only returns drafted contents" do
        contents = Content.draft
        expect(contents).not_to include(published)
      end
    end
  end
end
