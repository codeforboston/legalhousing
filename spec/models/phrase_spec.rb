require 'rails_helper'

RSpec.describe Phrase, type: :model do

  it 'is valid with content present' do 
    phrase = Phrase.create(content: "no elderly dogs")

    expect(phrase.content).to eq("no elderly dogs")
  end

  it 'truncates Phrase table and resets id' do 
    Phrase.reset_phrases
    expect(Phrase.count).to eq(0)
    phrase = Phrase.create(content: "asdf")

    expect(phrase.id).to eq(1)
  end

  it 'imports the app/assets/Words.txt file' do 
    Phrase.reset_phrases
    Phrase.import_words

    expect(Phrase.count).to eq(40)
  end
end