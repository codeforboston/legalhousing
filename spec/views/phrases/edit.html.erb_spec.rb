require 'rails_helper'

RSpec.describe "phrases/edit", type: :view do
  before(:each) do
    @phrase = assign(:phrase, Phrase.create!())
  end

  it "renders the edit phrase form" do
    render

    assert_select "form[action=?][method=?]", phrase_path(@phrase), "post" do
    end
  end
end
