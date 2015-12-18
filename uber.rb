require 'uber'

client = Uber::Client.new do |config|
  config.server_token  = "JfVVyui2AREKKEkZn4DDbXHsRXX77vXbc3s_tVbG"
  config.client_id     = "jz4Y4w0FYGDLJHhcfZqnn6hgXsgQCRt-"
  config.client_secret = "8gtqm5EsXguIEuJOvDIjibQT5FvIueIX2lZLacti"
  config.bearer_token  = "TOKEN_OAUTH_USUARIO"
  # config.sandbox=true
end




client.products(latitude: "25.676044", longitude: "-100.416745").each do |singleUber|
	precio=singleUber.price_details
  puts singleUber.product_id+" UBER:"+singleUber.display_name+"("+singleUber.description+") Precio por minuto:"+precio[:cost_per_minute].to_s+" banderazo:"+precio[:minimum].to_s

end

# pedir uber
# client.trip_request
# estimado de precio
puts client.price_estimations(start_latitude: "25.676044", start_longitude: "-100.416745",
                         end_latitude: "25.676087", end_longitude: "-100.414219")

while 1
	driverUber=client.trip_request( product_id: "cfda59a6-ba2b-43d2-acaa-10680bc57695",start_latitude: "25.676044", start_longitude: "-100.416745")
	puts driverUber.request_id.inspect
	puts driverUber.status.inspect
	puts driverUber.vehicle.inspect
	puts driverUber.driver.inspect
	puts driverUber.location.inspect
	puts driverUber.inspect
	puts driverUber.eta.inspect
	puts driverUber.surge_multiplier.inspect
	puts driverUber.meta.inspect
	puts driverUber.errors.inspect	
end


# require 'net/https'
# require 'uri'
# uri = uri = URI.parse("https://sandbox-api.uber.com/v1/requests?latitude=25.676866&longitude=-100.341341&product_id=03227718-935e-402b-9516-b96f33e53c52")
# http = Net::HTTP.new(uri.host, uri.port)
# http.use_ssl = true


# headers = { "Authorization"=> "Bearer b3a2o1C2OxECgCJQ0p5uFZWF5IqSrj","server_token" => "JfVVyui2AREKKEkZn4DDbXHsRXX77vXbc3s_tVbG" }
# request = Net::HTTP::Post.new(uri.request_uri, headers)

# response = http.request(request)
# puts response.body 
