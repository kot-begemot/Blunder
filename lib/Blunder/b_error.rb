#this is some general class that can be used in any object
#simple example
#BError.add_error some_object, 'while_do_some_stuff', '404', "Gateway returned: body: #{'Bad_byy'}", 'Gateway returned an error.'
class BError
  include Blunder
  alias_method :add_error, :blunder_report_error if instance_methods.include?('add_error')

  blunder_drop_point 'void'

  @blunder_errors_on_fly = true
  @blunder_fine_errors = false

  #prototype...
  def BError.add_error mo_message, drop_point = nil, blunder_code = nil, information = nil, desc = nil
    blunder_drop_point drop_point if drop_point
    blunder_error_code(blunder_code,desc) if blunder_code and desc
    blunder_report_foreign_error mo_message,  blunder_code, information
  end
end
