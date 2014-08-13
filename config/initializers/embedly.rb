def initialize_embedly
	Embedly::API.new({:key => ENV["oembed_key"]})
end

$embedly_api = initialize_embedly