#this module contain any functions that relates
#to class. It will later extend the class on include event
module Blunder::ClassMethods
  
  #this function is designed to define the possible drop points
  # explanation in the including class
  def blunder_drop_point point, &block
    point = point.to_sym
    unless blunder_drop_points.has_key? point
      blunder_drop_points.merge! point => []
    end
    self.blunder_current_drop_point = point
    class_eval(&block) if block_given?
  end

  # add codes to last activated drop point
  def blunder_error_code code, desc
    code = code.to_s
    desc = desc.to_s
    unless blunder_drop_points[blunder_current_drop_point].include? code
      blunder_drop_points[blunder_current_drop_point] << code
      blunder = blunders_model.find_or_create_by_code_and_drop_point(code,blunder_current_drop_point.to_s)
      blunder.update_attribute :description, desc unless blunder.description == desc
    end
  end

  #report an error for any object
  def blunder_report_foreign_errors object, code = nil, log = nil
    error_log = blunder_logs_model.create(
      :source_type => blunder_object_name(object),
      :source_id => blunder_object_id(object),
      :log_details => log
    )
    if (app = blunder_appropriate_by code )
      error_log.update_attribute( :factory_fault_id, app.id )
    end
  end

  #obtain all foreign object errors
  def blunder_obtain_all_foreign_errors object, conditions = nil
    blunder_obtain_foreign_errors object, nil, conditions
  end

  #obtain foreign object errors
  def blunder_obtain_foreign_errors object, code = nil, conditions = nil
    scoped_blunders = blunder_logs_model
    if (app = blunder_appropriate_by code )
      scoped_blunders = scoped_blunders.scoped(:conditions => {:factory_fault_id => app.id})
    end
    if conditions
      scoped_blunders = scoped_blunders.scoped(conditions)
    end
    scoped_blunders.find(  :all,
                              :conditions => {
                                :source_type => blunder_object_name(object),
                                :source_id => blunder_object_id(object)
                              })
  end

  #returns an appropriate object name
  def blunder_object_name object
    (object.name rescue object.class).to_s
  end

  #returns an appropriate object id
  def blunder_object_id object
    object.id rescue object.object_id
  end

  #returns an model that handles drop points descriptions
  def blunders_model
    begin
      eval @blunders_table
    rescue
      raise 'Wrong table was specified for blunders'
    end
  end

  #return a model that will handles the logs
  def blunder_logs_model
    begin
      eval @blunder_logs_table
    rescue
      raise 'Wrong table was specified for blunder logs'
    end
  end

  #returns or creates a array with drop point for specific class
  def blunder_object
    (Blunder::DropPoints[self] ||= Blunder::DropPoints.new self.name)
  end

  #returns all drop points in hash
  def blunder_drop_points
    blunder_object.drop_points
  end
end