require 'rails_helper'

RSpec.describe "scrapers/new", type: :view do
  before(:each) do
    assign(:scraper, Scraper.new())
  end

  it "renders new scraper form" do
    render

    assert_select "form[action=?][method=?]", scrapers_path, "post" do
    end
  end
end
