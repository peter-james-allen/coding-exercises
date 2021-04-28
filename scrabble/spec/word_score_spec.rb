require 'word_score'

describe '#word_score' do
  context 'should calculate the scrabble score for a string' do
    it 'with one letter' do
      expect(word_score('A')).to eq 1
    end
  end
end