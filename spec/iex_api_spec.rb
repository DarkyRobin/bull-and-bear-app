# spec/iex_api_spec.rb

require 'rails_helper'
require 'webmock/rspec'

# Placeholder implementation of IEXApi class/module
class IEXApi
  def fetch_stock_quote(stock_symbol)
    # Your actual implementation using IEX::Api.client
    # Example: IEX::Api::Stock.quote(stock_symbol).latest_price
    # Replace this with your actual code
    150.0
  end
end

describe IEXApi do
  describe '#fetch_stock_quote' do
    it 'returns the latest price for a stock' do
      # Configure the IEX client with a test token
      IEX::Api.configure do |config|
        config.publishable_token = 'pk_4ff0bea6938b424a9c81c02f15fa4e39'
        config.secret_token = 'sk_c9b556df020d4fb3b2ed41fa657076b1'
        config.endpoint = 'https://api.iex.cloud/v1/d'
      end

      # Stub the API request using WebMock
      stub_request(:get, 'https://api.iex.cloud/v1/data/core/quote/stock/AAPL/quote')
        .to_return(status: 200, body: '{"latestPrice": 150.0}', headers: {})

      # Instantiate your class or module that uses the IEX client
      iex_api_instance = IEXApi.new

      # Make the method call that interacts with IEX Cloud API
      result = iex_api_instance.fetch_stock_quote('AAPL')

      # Assertions
      expect(result).to eq(150.0)
    end
  end
end
