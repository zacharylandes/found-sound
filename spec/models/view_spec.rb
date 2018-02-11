require 'rails_helper'

describe "instance methods" do
  it "returns only items under two months old" do
    young_views = create_list(:view, 4)
    old_views = create_list(:view, 2, created_at: 2.months.ago)
    views = View.all

    expect(views.count).to eq(4)
    views.first.created_at.should be > 2.months.ago
    views[1].created_at.should be > 2.months.ago
    views[2].created_at.should be > 2.months.ago
    views.last.created_at.should be > 2.months.ago
  end
end
