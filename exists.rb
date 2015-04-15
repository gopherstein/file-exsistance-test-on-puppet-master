require 'puppet/parser/functions'
#Will return True/False if file exsists on puppet master.
Puppet::Parser::Functions.newfunction(:exists, :type => :rvalue, :doc => <<-EOS
    EOS
  ) do |*arguments|

    arguments = arguments.shift if arguments.first.is_a?(Array)

    raise Puppet::ParseError, "exists(): Wrong number of arguments " +
      "given (#{arguments.size} for 1)" if arguments.size < 1

    file = arguments.shift

    raise Puppet::ParseError, 'exists(): Requires a string type ' +
      'to work with' unless file.is_a?(String)

    # We want to be sure that we have the complete path ...
    file = File.expand_path(file)

    File.exists?(file)
  end
