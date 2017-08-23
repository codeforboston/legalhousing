require 'rails_helper'

RSpec.describe "phrases/new", type: :view do
  before(:each) do
    assign(:phrase, Phrase.new())
  end

  it "renders new phrase form" do
    render

    assert_select "form[action=?][method=?]", phrases_path, "post" do
    end
  end
end
