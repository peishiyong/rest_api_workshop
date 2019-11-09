require 'faraday'
require 'json'
require 'pp'


class TicketClient
  BASE_URL='https://z3ndtapiador.zendesk.com'

  def list_tickets
    # API doc: https://developer.zendesk.com/rest_api/docs/support/tickets#list-tickets

    endpoint = "/api/v2/tickets.json"
    query_param = [
      'sort_order=desc',
      'sort_by=created_at',
      'per_page=15'
    ].join('&')

    response = connection.get("#{endpoint}?#{query_param}")
    print_response(response)
  end

  def create_ticket
    # API doc: https://developer.zendesk.com/rest_api/docs/support/tickets#create-ticket
    endpoint = "/api/v2/tickets.json"
    request_body = {
      ticket: {
        subject: '[peishi] Where is my order? Very hangry',
        comment: {
          body: 'Ordered 2 hours ago, still not deliered!'
        }
      }
    }.to_json

    response = connection.post(endpoint, request_body)
    print_response(response)
  end

  def update_ticket
    # API doc: https://developer.zendesk.com/rest_api/docs/support/tickets#update-ticket

    id = 155
    endpoint = "/api/v2/tickets/#{id}.json"
    request_body = {
      ticket: {
        status: 'solved'
      }
    }.to_json

    response = connection.put(endpoint, request_body)
    print_response(response)
  end

  def delete_ticket
    raise NotImplementedError

    # Zendesk doc: https://developer.zendesk.com/rest_api/docs/support/tickets#delete-ticket

    response = nil # make the faraday call here
    print_response(response)
  end

  private

  def connection
    @connection ||= begin
                      Faraday.new(BASE_URL) do |conn|
                        conn.adapter(Faraday.default_adapter)  # make requests with Net::HTTP
                        conn.authorization(:Bearer, ENV['API_TOKEN'])
                        conn.headers['content-type'] = 'application/json'
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
