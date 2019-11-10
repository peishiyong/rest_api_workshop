require 'faraday'

class TicketClient
  BASE_URL='https://z3npyongtest.zendesk.com/api/v2'
  API_TOKEN=ENV['API_TOKEN']

  def get_tickets
    # API doc: https://developer.zendesk.com/rest_api/docs/support/tickets#list-tickets
    raise NotImplementedError
  end

  def create_ticket
    # API doc: https://developer.zendesk.com/rest_api/docs/support/tickets#create-ticket
    raise NotImplementedError

    request_url = "#{BASE_URL}/tickets.json"
    request_body = {
      # fill this in
    }
    response = nil # make the faraday call
    print_response(response)
  end

  def update_ticket
    raise NotImplementedError

    # API doc: https://developer.zendesk.com/rest_api/docs/support/tickets#update-ticket
    response = nil # make the faraday call
    print_response(response)
  end

  def delete_ticket
    raise NotImplementedError

    # Zendesk doc: https://developer.zendesk.com/rest_api/docs/support/tickets#delete-ticket

    response = nil # make the faraday call here
    print_response(response)
  end

  private

  def print_response(response)
    message = response.success? ? 'HOORAY! :) ' : 'Opps :( '

    puts '----------------------'
    puts message
    puts 'Response Status: ' + response.status.to_s
    puts response.body
    puts '----------------------'
  end
end
