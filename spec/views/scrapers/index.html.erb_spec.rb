require 'rails_helper'

RSpec.describe "scrapers/index", type: :view do
  before(:each) do
    assign(:scrapers, [
      Scraper.create!(),
      Scraper.create!()
    ])
  end

  it "renders a list of scrapers" do
    render
  end
end
