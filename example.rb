require 'faraday'

response = Faraday.get('http://artii.herokuapp.com/make?text=hello%20world')
response.body
