require 'faraday'

class TicketClient
  def test
    response = Faraday.get('http://artii.herokuapp.com/make?text=hello%20world')
    response.body
  end

  def get_tickets
  end

  def create_ticket
  end

  def update_ticket
  end

  def delete_ticket
  end
end
