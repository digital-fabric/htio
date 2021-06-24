# frozen_string_literal: true

require 'uri'

module Htio
  class Session
    def initialize(cache: nil, cookie_store: nil, &block)
      @links = {}
      @cache = cache
      @cookie_store = cookie_store
      scope(&block) if block
    end

    def scope
      yield self
    ensure
      close
    end

    def close
      @links.values.each(&:close)
    end

    def get(url)
      spec = request_spec(url, method: 'GET')
      connect(spec) { |conn| conn.request(spec) }
    end

    def request_spec(url, method: )
      u = URI.new(url)
      {
        uri: u,
        server_ref: [u.protocol, u.host, u.port],
        protocol: u.protocol,
        host: u.host,
        path: u.path,
        method: method
      }
    end

    def connect(spec, &block)
      link = @links[spec[:server_ref]] ||= Link.new(spec[:server_ref])
      link.connect(&block)
    end
  end
end