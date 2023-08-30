# frozen_string_literal: true

require 'shellwords'

# Transforms a hash into a string of docker swarm init flags
Puppet::Functions.create_function(:docker_service_flags) do
  def docker_service_flags(*arguments)
    opts = arguments[0] || {}
    flags = []

    flags << '--detach' if opts['detach'].to_s != 'true'

    flags << "'#{opts['service_name']}'" if opts['service_name'].to_s != 'undef'

    flags << "--env '#{opts['env']}'" if opts['env'].to_s != 'undef'

    flags << "--label '#{opts['label']}'" if opts['label'].to_s != 'undef'

    flags << "--publish '#{opts['publish']}'" if opts['publish'].to_s != 'undef'

    flags << "--replicas '#{opts['replicas']}'" if opts['replicas'].to_s != 'undef'

    flags << '--tty' if opts['tty'].to_s != 'false'

    flags << "--user '#{opts['publish']}'" if opts['user'].to_s != 'undef'

    flags << "--workdir '#{opts['workdir']}'" if opts['workdir'].to_s != 'undef'

    unless opts['extra_params'].empty?
      opts['extra_params'].each do |param|
        flags << param
      end
    end
    flags << "'#{opts['image']}'" if opts['image'].to_s != 'undef'

    flags.flatten.join(' ')
  end
end
