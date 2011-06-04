require File.join(File.dirname(__FILE__),'..','spec_helper')

describe Blunder, ' - class functionality' do
  
  before(:all) do
    @incuded_blunder_class_methods = [
      :blunder_drop_point,
      :blunder_error_code,
      :blunder_object_name,
      :blunder_object_id,
      :blunders_model,
      :blunder_logs_model,
      :blunder_drop_points
    ]
    @blunder_class_methods = [
      :blunder_report_foreign_errors,
      :blunder_obtain_all_foreign_errors,
      :blunder_obtain_foreign_errors,
      :blunder_object
    ]
  end
  
  it 'should define setter and getter methods for log models' do
    Blunder.should respond_to(:blunders_table)
    Blunder.should respond_to(:blunder_logs_model)
    Blunder.should respond_to(:blunders_table=)
    Blunder.should respond_to(:blunder_logs_model=)
  end
  
  it 'sould validate correct table structure' do
    
  end 
  
  it 'should define a class level methods' do
    
  end
  
  it 'should define a incuded class level methods' do
    #Foo.should respond_to(:blunder_drop_points)
  end

  it 'should define a class level methods' do
    #Foo.should respond_to(:blunder_error_code)
  end
  
end


class Foo
  include Blunder
end


describe 'Foo', ' - class functionality' do
  
  it 'should not reassing model tables' do
    Foo.should respond_to(:blunders_table)
    Foo.should respond_to(:blunder_logs_model)
    Foo.should_not respond_to(:blunders_table=)
    Foo.should_not respond_to(:blunder_logs_model=)
  end
  
  it 'should define a incuded class level methods' do
    #Foo.should respond_to(:blunder_drop_points)
  end
  
  it 'should not define a class level methods' do
    #Foo.should respond_to(:blunder_error_code)
  end
  
end