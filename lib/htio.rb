# frozen_string_literal: true

require_relative './htio/session'

module Htio
  def self.get(url)
    default_session.get(url)
  end

  def self.default_session
    @default_session ||= Session.new
  end

  def self.open(**opts)
    Session.new(**opts)
  end
end
