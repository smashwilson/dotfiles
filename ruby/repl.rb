# common utilities that can be shared between irb and pry.

require File.join(__dir__, 'fog')

class Object
  def local_methods obj = self
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
end

# An object we can return that clears the screen in #inspect.
class ScreenWipe
  def self.inspect
    @code ||= `clear`
  end
end

def clear
  ScreenWipe
end
