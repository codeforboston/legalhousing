require 'rails_helper'

RSpec.describe "scrapers/show", type: :view do
  before(:each) do
    @scraper = assign(:scraper, Scraper.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
