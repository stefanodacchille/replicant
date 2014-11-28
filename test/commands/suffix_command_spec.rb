require 'helper'

class SuffixCommandSpec < CommandSpecBase

  describe "with valid arguments" do
    it "accepts a suffix with one element" do
      @repl.default_package = 'myapp'
      command = silent SuffixCommand.new(@repl, ".debug")
      command.execute
      @repl.default_package.must_equal "myapp.debug"
    end

    it "accepts a package with two elements" do
      @repl.default_package = 'myapp'
      command = silent SuffixCommand.new(@repl, ".debug.me")
      command.execute
      @repl.default_package.must_equal "myapp.debug.me"
    end
  end

  describe "with invalid arguments" do
    it "refuses a suffix not starting with a dot" do
      @repl.default_package = 'myapp'
      command = silent SuffixCommand.new(@repl, 'debug')
      command.expects(:run).never
      command.execute
      @repl.default_package.must_equal 'myapp'
    end

    it "refuses a suffix containing non-alphanumeric characters" do
      @repl.default_package = 'myapp'
      command = silent PackageCommand.new(@repl, ".myapp.some$thing")
      command.expects(:run).never
      command.execute
      @repl.default_package.must_equal 'myapp'
    end
  end
end

