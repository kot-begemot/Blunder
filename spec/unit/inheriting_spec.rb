require File.join(File.dirname(__FILE__),'..','spec_helper')

#free fly
class Foo
  include Blunder
end


desribe 'Blunder and Foo', ' - their common properties' do
  it 'Foo should use same tabels as Blunder' do

  end

  it 'Foo should use same tabels as Blunder after modification' do

  end
end


desribe 'Foo' do

  it 'should have a drop points and errors' do
    
  end

  it 'should commit an error' do

  end

  it 'should commit error on fly' do

  end

  it 'should find appropriate drop point' do

  end

end

#restricted fly
class Bar
    include Blunder
end


desribe 'Bar' do

  it 'should have a drop points and errors' do

  end

  it 'should commit an error' do

  end

  it 'should not commit error on fly' do

  end

  it 'should not find appropriate drop point' do

  end

end

