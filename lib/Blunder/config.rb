#this module contain all blunder configurations
#default configurations can be overwritten later in the projects configurations
module Blunder
  module Config

    #tables that will store all information about any failures
    #that table store drop points and its descriptions
    @blunders_table = 'FactoryFault'
    #this table will store any instance errors
    @blunder_logs_table = 'FaultyLogs'

    #if this is set, then the errors will be created if it is not appears
    #in the list
    @blunder_errors_on_fly = false
    #if this is set then if the error is not presented for the current
    #drop point it will not search for appropriate in other drop points
    @blunder_fine_errors = false

    #this function should execute any routine related before the first run
    # it actually will check for corresponding tables existing
    #and if those are missing it will create them
    def Config.setup
      puts "here will be created missing tables"
    end
  end
end
