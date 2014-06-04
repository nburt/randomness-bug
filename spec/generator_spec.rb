require './lib/generator'
require 'pp'

describe Generator do

  it 'should generate people' do
    generator = Generator.new(4)
    expect(generator.people.length).to eq 4
  end

  it 'should generate companies' do
    generator = Generator.new(4)
    result = generator.companies
    expect(result.length).to eq 2
  end

  it 'should generate one company for every two people' do
    rows = Generator.new(10).generate
    people = rows.map { |r| [r[0], r[1]] }
    expect(people.uniq.size).to eq 10
    companies = rows.map { |r| r[2] }
    expect(companies.uniq.size).to eq 5
  end

end