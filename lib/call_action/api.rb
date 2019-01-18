require "net/http"
require "json"
require "uri"

module CallAction

  class Api

    attr_accessor :token, :base_url, :api_version, :headers

    # Initializer
    def initialize headers = {}
    	@token = CallAction.auth_token
    	@api_version =  CallAction.api_version
    	@base_url = "https://callaction.co/api/"
    	@headers = {"Accept" => "application/json", "Content-Type" => "application/json", "X-AUTH-TOKEN" => @token}.merge(headers)
    end 	

    # To test installation
    def self.hi
      puts "Hello world!"
    end

    # To get list of all contacts
    def contacts start_date=nil, end_date=nil
    	url = URI.parse("#{@base_url}#{@api_version}/contacts")

      params = {}
      params[:start] = start_date if start_date.present?
      params[:end] = end_date if end_date.present?

      path = params.present? ? "#{url.request_uri}?".concat(params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&')) : url.request_uri

      request = Net::HTTP::Get.new(path)

      @headers.each {|k, v| request[k] = v }

  	  response = Net::HTTP.start(url.hostname, url.port, :use_ssl => url.scheme == 'https') do |http|
  		  http.request(request)
  	  end	

  	  JSON.parse(response.body)["contacts"].collect {|contact| CallAction::Contact.new contact }
    end

    # To get list of all activities by particular contact specified by unique UUID
    def activities contact_id
    	url = URI.parse("#{@base_url}#{@api_version}/contacts/#{contact_id}/activity")
    	request = Net::HTTP::Get.new(url.request_uri)

  	  @headers.each {|k, v| request[k] = v }

  	  response = Net::HTTP.start(url.hostname, url.port, :use_ssl => url.scheme == 'https') do |http|
  		  http.request(request)
  	  end	

  	  JSON.parse(response.body)["activities"].collect {|activity| CallAction::Activity.new activity }
    end

    # Get list of all channels
    def channels
  	  url = URI.parse("#{@base_url}#{@api_version}/channels")
  	  request = Net::HTTP::Get.new(url.request_uri)

  	  @headers.each {|k, v| request[k] = v }

    	response = Net::HTTP.start(url.hostname, url.port, :use_ssl => url.scheme == 'https') do |http|
    		http.request(request)
  	  end	

  	  JSON.parse(response.body)["channels"].collect {|channel| CallAction::Channel.new channel }
    end

    # Get list of all sources
    def sources
    	url = URI.parse("#{@base_url}#{@api_version}/sources")
  	  request = Net::HTTP::Get.new(url.request_uri)

  	  @headers.each {|k, v| request[k] = v }

  	  response = Net::HTTP.start(url.hostname, url.port, :use_ssl => url.scheme == 'https') do |http|
  		  http.request(request)
  	  end	

  	  JSON.parse(response.body)["sources"].collect {|source| CallAction::Source.new source }
    end

  end


end  