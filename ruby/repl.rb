# common utilities that can be shared between irb and pry.

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

def trace_sql!
  if block_given?
    result = nil
    trace_sql!
    begin
      result = yield
    ensure
      untrace_sql!
    end
    result
  else
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    nil
  end
end

def untrace_sql!
  ActiveRecord::Base.logger = GitHub::Logger.new(Rails.root.join(GitHub::Logger::DEVELOPMENT_LOG_FILE))
  nil
end

def include_url_helpers
  include Rails.application.routes.url_helpers
  nil
end

module IntegrationTestPryHelpers
  def puts_select(*args)
    puts HTMLSelector.new(args) { nodeset document_root_element }.select.to_html
  end
end

if defined? GitHub::IntegrationTestCase
  class GitHub::IntegrationTestCase
    include IntegrationTestPryHelpers
  end
end
