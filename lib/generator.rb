require 'faker'
I18n.enforce_available_locales = false

class Generator

  def initialize(length)
    @length = length
  end

  def people
    @length.times.map do
      [Faker::Name.first_name, Faker::Name.last_name]
    end
  end

  def companies
    (@length / 2).times.map do
      Faker::Company.name
    end
  end

  def generate
    i = 0
    company = companies
    people.map do |person|
      result = (person << company[i])
      i += 1
      i = 0 if i == (@length / 2)
      result
    end
  end

end