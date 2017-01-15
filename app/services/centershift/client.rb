# frozen_string_literal: true
module Centershift
  # Centershift Client
  class Client
    include Singleton

    WSDL = "https://slc.centershift.com/store40/sws.asmx?WSDL"

    def initialize
      @client = Savon.client(wsdl: WSDL) do
        convert_request_keys_to :none
      end
      @operations = @client.operations
    end

    def call(action:, request:)
      message = { "Request" => request }.merge(lookup_user)
      @client.call(action, message: message)
    end

    private

    def lookup_user
      @lookup_user ||= {
        "LookupUser_Request" => {
          "Username" => "TISMMymarket",
          "Password" => 'i"jV@7FEFB',
          "Channel" => 13
        }
      }
    end
  end
end
