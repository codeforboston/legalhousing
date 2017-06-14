require 'rails_helper'

RSpec.describe "phrases/show", type: :view do
  before(:each) do
    @phrase = assign(:phrase, Phrase.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
