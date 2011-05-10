#drop point is the place where the the script may caught an error.
#code is a short description of an error
#description is a full error description
#in our case description is a row that will be available to the clients
#
#those are the methods that will be available in inherited class
module Blunder
end

require File.join( File.dirname(__FILE__), 'Blunder', 'drop_points')
require File.join( File.dirname(__FILE__), 'Blunder', 'class_methods')
require File.join( File.dirname(__FILE__), 'Blunder', 'multi_mixer')
require File.join( File.dirname(__FILE__), 'Blunder', 'config')
require File.join( File.dirname(__FILE__), 'Blunder', 'blunder')
require File.join( File.dirname(__FILE__), 'Blunder', 'b_error')