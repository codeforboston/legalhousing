require 'rails_helper'

RSpec.describe "scrapers/edit", type: :view do
  before(:each) do
    @scraper = assign(:scraper, Scraper.create!())
  end

  it "renders the edit scraper form" do
    render

    assert_select "form[action=?][method=?]", scraper_path(@scraper), "post" do
    end
  end
end
