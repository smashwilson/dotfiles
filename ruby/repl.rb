# common utilities that can be shared between irb and pry.

class Object
  def local_methods obj = self
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
end

if defined?(ActiveRecord::Base) && defined?(GitHub::Logger)
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
end

if defined?(::User)
  def me
    @_me ||= ::User.find_by!(login: "monalisa")
  end
end

if defined?(::Repository)
  def repo
    @_repo ||= ::Repository.nwo("monalisa/repo")
  end
end

if defined? Rails
  def include_url_helpers
    include Rails.application.routes.url_helpers
    nil
  end
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
