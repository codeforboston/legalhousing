require 'rails_helper'

RSpec.describe "phrases/index", type: :view do
  before(:each) do
    assign(:phrases, [
      Phrase.create!(),
      Phrase.create!()
    ])
  end

  it "renders a list of phrases" do
    render
  end
end
