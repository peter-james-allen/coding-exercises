require 'word_score'

describe '#word_score' do
  context 'should calculate the scrabble score for a string' do
    it 'with one 1 point letter' do
      expect(word_score(%w[E A I O N R T L S U].sample)).to eq 1
    end
    it 'with one 2 point letter' do
      expect(word_score(%w[D G].sample)).to eq 2
    end
  end
end