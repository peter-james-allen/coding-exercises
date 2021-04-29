# frozen_string_literal: true

LETTER_SCORES = {
  E: 1, A: 1, I: 1, O: 1,
  N: 1, R: 1, T: 1, L: 1,
  S: 1, U: 1, D: 2, G: 2,
  B: 3, C: 3, M: 3, P: 3,
  F: 4, H: 4, V: 4, W: 4,
  Y: 4, K: 5, J: 8, X: 8,
  Q: 10, Z: 10
}.freeze

LETTER_DISTRIBUTION = {
  E: 12, A: 9, I: 9, O: 8,
  N: 6, R: 6, T: 6, L: 4,
  S: 4, U: 4, D: 4, G: 3,
  B: 2, C: 2, M: 2, P: 2,
  F: 2, H: 2, V: 2, W: 2,
  Y: 2, K: 1, J: 1, X: 1,
  Q: 1, Z: 1
}.freeze

DEFAULT_RACK_SIZE = 7

def word_score(word)
  word.split('').map(&:letter_score).sum
end

# Adding letter_score method to String class
class String
  def letter_score
    LETTER_SCORES[itself.upcase.to_sym]
  end
end

def random_letter
  rand(65..90).chr
end

def get_rack(rack_size = DEFAULT_RACK_SIZE)
  (1..rack_size).map { pick_from_bag }.join('')
end

def create_bag
  bag = []
  LETTER_DISTRIBUTION.each do |key, value|
    value.times { bag.push(key) }
  end
  bag
end

BAG = create_bag

def pick_from_bag
  BAG.delete_at(rand(BAG.length))
end
