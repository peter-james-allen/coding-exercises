require 'results'

describe '#read_results' do

  # Result file contains following data:
  # Cardiff West, 11014, C, 17803, L, 4923, UKIP, 2069, LD
  # Islington South & Finsbury, 22547, L, 9389, C, 4829, LD, 3375, UKIP, 3371, G, 309, Ind

  let(:results) {read_results('results.csv')}

  it 'shoud return a hash' do
    expect(results).to be_a Hash
  end

  it 'should create a hash with same number of lines as in the input' do
    expect(results.length).to eq 2
  end

  it 'should create a hash with the results' do
    expect(results['Cardiff West']).to be_a Hash
    expect(results['Islington South & Finsbury']).to be_a Hash
  end

  it 'should create a result hash with an entry for each party' do
    expect(results['Cardiff West'].length).to eq 4
    expect(results['Islington South & Finsbury'].length).to eq 6
  end

  it 'should convert the party names' do
    expect(results['Cardiff West'].keys).to include 'Conservative Party'
    expect(results['Islington South & Finsbury'].keys).to include 'Independent'
  end

  it 'should calculate the vote percentage' do
    expect(results['Cardiff West']['UKIP']).to eq 13.75
    expect(results['Islington South & Finsbury']['Liberal Democrats']).to eq 11.02
  end

end
