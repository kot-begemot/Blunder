require File.join(File.dirname(__FILE__),'..','spec_helper')

class Foo
  include Blunder
end

class Bar
  include Blunder
end

desribe 'Bar and Foo', 'shoudl not interfere' do

  it 'Bar should not commit errors as Foo object' do

  end

  it 'Bar should not commit drop points as Foo object' do

  end

  it 'Bar should not access Foo\'s class errors' do

  end

  it 'Bar should not access Foo\'s drop points' do

  end

  it 'Bar should not modify Foo\'s errors' do

  end

  it 'Bar should not modify Foo\'s drop points' do

  end

end