require 'faraday'

# Faraday docs https://lostisland.github.io/faraday/usage/
response = Faraday.get('http://artii.herokuapp.com/make?text=hello%20world')
response.body
