require 'faraday'
require 'json'
require 'pp'


class TicketClient
  BASE_URL='https://z3ndtapiador.zendesk.com'

  def list_tickets
    raise NotImplementedError
    # API doc: https://developer.zendesk.com/rest_api/docs/support/tickets#list-tickets

    response = nil # make the faraday call
    print_response(response)
  end

  def create_ticket
    raise NotImplementedError

    # API doc: https://developer.zendesk.com/rest_api/docs/support/tickets#create-ticket
    endpoint = "/api/v2/tickets.json"
    request_body = {
      # fill this in
    }.to_json

    response = connection.post(endpoint, request_body)
    print_response(response)
  end

  def update_ticket
    raise NotImplementedError

    # API doc: https://developer.zendesk.com/rest_api/docs/support/tickets#update-ticket
    response = nil # make the faraday call
    print_response(response)
  end

  def delete_ticket
    # Zendesk doc: https://developer.zendesk.com/rest_api/docs/support/tickets#delete-ticket

    id = 157
    endpoint = "/api/v2/tickets/#{id}.json"

    response = connection.delete(endpoint)
    print_response(response)
  end

  private

  def connection
    @connection ||= begin
                      Faraday.new(BASE_URL) do |conn|
                        conn.adapter(Faraday.default_adapter)  # make requests with Net::HTTP
                        conn.authorization(:Bearer, ENV['API_TOKEN'])
                        # conn.headers['content-type'] = 'application/json'
                      end
                    end
  end

  def print_response(response)
    puts '----------------------'

    if response.success?
      puts 'HOORAY! :)'
      puts 'Response Status: ' + response.status.to_s
      begin
        pp JSON.parse(response.body)
      rescue JSON::ParserError
      end
    else
      puts 'Opps :( '
      puts 'Response Status: ' + response.status.to_s
      pp JSON.parse(response.body)

      if ENV['DEBUG']
        puts "\nMore details:"
        pp response
      end
    end

    puts '----------------------'
  end
end
