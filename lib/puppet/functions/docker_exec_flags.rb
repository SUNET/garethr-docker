# frozen_string_literal: true

require 'shellwords'

# Transforms a hash into a string of docker exec flags
Puppet::Functions.create_function(:docker_exec_flags) do
  def docker_exec_flags(*arguments)
    opts = arguments[0] || {}
    flags = []

    flags << '--detach=true' if opts['detach']

    flags << '--interactive=true' if opts['interactive']

    flags << '--tty=true' if opts['tty']

    flags.flatten.join(' ')
  end
end
