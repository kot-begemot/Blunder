#that model contains all methods
#that would be available to any object that will include it
module Blunder
  def self.included(base) #:nodoc:
    base.extend ClassMethods
    base.extend MultiMixer
    base.send 'include', MultiMixer
    base.class_eval do
      attr_accessor :blunders_table
      attr_accessor :blunder_logs_table
    end
    base.extend Config
    base.instance_eval do
      #current instance drop point
      attr_accessor :blunder_current_drop_point
      alias_method :old_method_missing, :method_missing if private_methods.include?('method_missing')
      alias_method :method_missing, :blunder_method_missing
    end
  end

  #set current drop point for instance
  def blunder_set_drop_point point
    self.blunder_current_drop_point = point
  end

  #returns a table which will handles a possible errors
  def blunders_model
    self.class.blunders_model
  end

  #return a model that will handle the logs
  def blunder_logs_model
    self.class.blunder_logs_model
  end

  #report an error for instance
  def blunder_report_error code = nil, log = nil
    self.blunder_report_foreign_error self, code, log
  end

  #get errors for instance
  def blunder_obtain_errors code = nil, conditions = nil
    self.blunder_report_foreign_errors self, code, conditions
  end

  #obtain all errors for instance
  def blunder_obtain_all_errors conditions = nil
    self.blunder_obtain_all_foreign_errors self, conditions
  end

  private

  #returns a Hash of all drop points for that object
  def blunder_drop_points
    self.class.blunder_drop_points
  end

  #return a name of an instance class
  def blunder_instance_name
    self.class.blunder_instance_name self
  end

  #return instance id
  def blunder_instance_id
    self.class.blunder_instance_id self
  end

  #here might be your banner
  def blunder_method_missing(method, *args, &block)
    p "here might be your banner"
    old_method_missing method, *args, &block
  end
end