require 'csv'

PARTIES = { 'C' => 'Conservative Party',
            'L' => 'Labour Party',
            'UKIP' => 'UKIP',
            'LD' => 'Liberal Democrats',
            'G' => 'Green Party',
            'Ind' => 'Independent',
            'SNP' => 'SNP'
          }

def read_results(result_file)
  results = {}
  lines = CSV.read(result_file)

  lines.each do |line|
    name = line[0]
    votes = line[1..].each_slice(2).to_a
    results[name] = {}
    total = line.map { |entry| entry.to_f }.reduce(:+)
    
    votes.each do |vote|
      party = PARTIES[vote[1].strip]
      count = vote[0].to_f
      results[name][party] = ((count / total) * 100.0).round(2)
    end
  end

  results
end