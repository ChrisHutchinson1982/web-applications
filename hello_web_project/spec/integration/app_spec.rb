require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /hello" do
    it 'returns "Hello!"' do 
      response = get('/hello')
      expect(response.body).to include('<h1>Hello!</h1>')
    end
  end
  context "GET /names" do
    it 'returns 200 OK and Julia, Mary, Karim' do
      response = get('/names?name1=Julia&name2=Mary&name3=Karim')
      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end

    it 'returns 200 OK and Chris, Graeme, YuLing' do
      response = get('/names?name1=Chris&name2=Graeme&name3=YuLing')
      expect(response.status).to eq(200)
      expect(response.body).to eq("Chris, Graeme, YuLing")
    end
  end
end