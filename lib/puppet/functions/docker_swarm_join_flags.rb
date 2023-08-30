# frozen_string_literal: true

require 'shellwords'

# Transforms a hash into a string of docker swarm init flags
Puppet::Functions.create_function(:docker_swarm_join_flags, type: :rvalue) do
  def docker_swarm_join_flags(*arguments)
    opts = arguments[0] || {}
    flags = []

    flags << 'join' if opts['join'].to_s != 'false'

    flags << "--advertise-addr '#{opts['advertise_addr']}'" if opts['advertise_addr'].to_s != 'undef'

    flags << "--listen-addr '#{opts['listen_addr']}'" if opts['listen_addr'].to_s != 'undef'

    flags << "--token '#{opts['token']}'" if opts['token'].to_s != 'undef'

    flags.flatten.join(' ')
  end
end
