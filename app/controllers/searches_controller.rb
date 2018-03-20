class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = "EDGKYN2I4DDTXW4SVFUZS3SYW3NGQJWQTEPQ2FE2HPTJDKOV"
      req.params['client_secret'] = "UWOPGCE4OIHE4XSSI5JKFXSH0XJRKQQLVOIDPTSH4VP1HCOV"
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    
    JSON.parse(@resp.body)
    
    @venues = body_hash["response"]["venues"]
    
    render 'search'
  end
end
