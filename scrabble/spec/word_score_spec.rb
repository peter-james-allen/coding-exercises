# frozen_string_literal: true

require 'word_score'

describe '#word_score' do
  context 'should calculate the scrabble score for a string' do
    it 'with one 1 point letter' do
      expect(word_score(%w[E A I O N R T L S U].sample)).to eq 1
    end
    it 'with one 2 point letter' do
      expect(word_score(%w[D G].sample)).to eq 2
    end
    it 'with one 3 point letter' do
      expect(word_score(%w[B C M P].sample)).to eq 3
    end
    it 'with one 4 point letter' do
      expect(word_score(%w[F H V W Y].sample)).to eq 4
    end
    it 'with one 5 point letter' do
      expect(word_score('K')).to eq 5
    end
    it 'with one 8 point letter' do
      expect(word_score(%w[J X].sample)).to eq 8
    end
    it 'with one 4 point letter' do
      expect(word_score(%w[Q Z].sample)).to eq 10
    end
    it 'with two letters' do
      expect(word_score('ZA')).to eq 11
    end
    it 'with multiple letters' do
      expect(word_score('GUARDIAN')).to eq 10
    end
  end
end

describe '#random_letter' do
    it 'should return a random capital letter' do
      1000.times { expect(('A'..'Z')).to include random_letter }
    end
end