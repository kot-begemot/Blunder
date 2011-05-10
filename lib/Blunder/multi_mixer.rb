#those methods available both in class and instance
#TODO: add ribbon drop point attribute accessor....
#so when current drop point is not used it will be nil
module Blunder::MultiMixer

  #currently active drop point for some object
  attr_accessor :blunder_current_drop_point
  #description in config file
  attr_accessor :blunder_errors_on_fly
  attr_accessor :blunder_fine_errors

  #find appropriate blunder record for specified code
  #in case blunder_errors_on_fly is set... that error will be simply created
  def blunder_appropriate_by code
    code = code.to_s
    unless blunder_drop_points[blunder_current_drop_point].include? code
      warn "No such code '#{code}' for the drop point '#{blunder_current_drop_point}' for object '#{blunder_object_name(self)}'. Trying to find appropriate..."
      unless blunder_fine_errors
        possible_dp = blunder_drop_points.find { |dp| dp.include? code }
        self.blunder_current_drop_point = possible_dp if possible_dp
      end
    end
    begin
      #by some reason that method did not get saved the object
      #blunders_model.send("find_#{'or_create_' if blunder_errors_on_fly}by_drop_point_and_code", blunder_current_drop_point, code)
      blunder = blunders_model.find_by_drop_point_and_code blunder_current_drop_point.to_s, code
      blunder ||= blunders_model.create!( :drop_point => blunder_current_drop_point.to_s, :code => code)
    rescue
      nil
    end
  end
end