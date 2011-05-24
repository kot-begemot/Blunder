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
      begin
        Blunder::blunders_model
      rescue
        ActiveRecord::ConnectionAdapters::SchemaStatements.create_table @blunders_table.tableize.to_sym do |t|
          t.column  :drop_point,  :string,  :limit => 255,  :default => nil, :null => true
          t.column  :code,        :string,  :limit => 255,  :default => nil, :null => true
          t.timestamps
        end
      end
      
      begin
        Blunder::blunder_logs_model
      rescue
        ActiveRecord::ConnectionAdapters::SchemaStatements.create_table @blunder_logs_table.tableize.to_sym do |t|
          t.column    :source_type, :string,  :limit => 255
          t.column    :source_id,   :string,  :limit => 255
          t.column    :factory_fault_id, :integer, :default => nil, :null => true
          t.column    :log_details,  :text, :default => nil,  :null => true
          t.timestamps
        end
      end
    end

    #that function will be executed in case a corresponding tables are missing
    def Config.execution
      raise 'Error: Please check whether you have executed Bundler::Config.setup'
    end
  end
end
