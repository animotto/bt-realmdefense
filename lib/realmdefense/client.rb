# frozen_string_literal: true

require 'net/http'

module RealmDefense
  ##
  # Client
  class Client
    HOST = 'td-users.babeltimeus.com'
    PORT = 80
    USER_AGENT = 'Dalvik/2.1.0 (Linux; U; Android 11; BR-K520WL Build/NS3B.202272.418)'
    UNITY_VERSION = '2018.4.18f1'

    def initialize
      @client = Net::HTTP.new(HOST, PORT)
    end

    def get(path, headers = {})
      request(method: __method__, path: path, headers: headers)
    end

    def post(path, data, headers = {})
      request(method: __method__, path: path, data: data, headers: headers)
    end

    private

    def request(**args)
      args[:headers]['User-Agent'] = USER_AGENT
      args[:headers]['X-Unity-Version'] = UNITY_VERSION

      case args[:method]
      when :get
        response = @client.get(args[:path], args[:headers])
      when :post
        response = @client.post(args[:path], args[:data], args[:headers])
      end

      raise ClientError, "[#{response.code}] #{response.body}" unless response.is_a?(Net::HTTPSuccess)

      response.body
    end
  end

  ##
  # ClientError
  class ClientError < StandardError; end
end
