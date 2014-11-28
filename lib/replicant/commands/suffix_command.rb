class SuffixCommand < Command

  def description
    "set an application id suffix"
  end

  def usage
    "#{name} .development"
  end

  def valid_args?
    args.present? && /^\.\w+(\.\w+)*$/ =~ args
  end

  def run
    output "Setting application id suffix to \"#{@repl.default_package+args}\""
    @repl.default_package += args
  end
end
