module CallAction
  class << self
    attr_accessor :api_version, :auth_token

    def config
      yield(self)
    end

  end
end

require 'call_action/contact'
require 'call_action/activity'
require 'call_action/channel'
require 'call_action/source'
require 'call_action/api'
