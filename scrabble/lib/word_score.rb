def word_score(word)
  if %w[D G].include?(word)
    2
  elsif %w[B C M P].include?(word)
    3
  else
    1
  end
end