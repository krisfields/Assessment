require "open-uri"
require 'addressable/uri'
require 'rest_client'
require 'json'

class AssessmentCommandLineTool

	WEBPATH="localhost:3000/"

	def show_customers
		path = WEBPATH + "customers.json"
		out = JSON.parse(RestClient.get(path))
	end

	def show_customer(customer_number)
		path = WEBPATH + "customers/" + customer_number.to_s + ".json"
		out = JSON.parse(RestClient.get(path))
  end

	def create_customer(first_name, last_name)
		path = WEBPATH + "customers"
		query_values = {
			first_name: first_name,
			last_name: last_name
		}
		RestClient.post(path, {:customer => {:first_name => first_name, :last_name => last_name}})
	end

	def show_orders
		path = WEBPATH + "orders.json"
		out = JSON.parse(RestClient.get(path))		
	end

	def show_order(order_number)
		path = WEBPATH + "orders/" + order_number.to_s + ".json"
		out = JSON.parse(RestClient.get(path))		
	end

	def create_order(price, customer_id)
		path = WEBPATH + "orders"
		query_values = {
			price: price,
			customer_id: customer_id
		}
		RestClient.post(path, {:order => {:price => price, :customer_id => customer_id}})		
	end
end