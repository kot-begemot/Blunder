#so after the Blunder get included somewhere
#a new instance is added to Blunder::DropPoints[].
#it can be accessible via Blunder::DropPoints[object_name]
#this instance stores all possible drop points and
#codes related to some object
#this idea taken from aasm (evil-smile)
class Blunder::DropPoints
  attr_accessor :drop_points, :blunders
  attr_reader :name

  def initialize(name)
    @name = name
    @drop_points = {}
  end

   def self.[](*args)
    (@blunders ||= {})[args]
  end

  def self.[]=(*args)
   val = args.pop
   (@blunders ||= {})[args] = val
  end
end