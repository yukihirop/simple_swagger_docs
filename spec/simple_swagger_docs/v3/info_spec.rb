require 'spec_helper'

RSpec.describe SimpleSwaggerDocs::V3::Info do
  let(:dummy_class) do
    class Dummy
      extend SimpleSwaggerDocs::V3::OpenAPI
      extend SimpleSwaggerDocs::V3::Info
    end
  end

  describe 'attributes' do
    subject { dummy_class.info }

    it 'should be set info meta' do
      expect(subject.title).to eq            'Swagger Petstore'
      expect(subject.description).to eq      'This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).      For this sample, you can use the api key `special-key` to test the authorization     filters.'
      expect(subject.terms_of_service).to eq 'http://swagger.io/terms/'
      expect(subject.version).to eq          '1.0.0'
      expect(subject.contact.name).to eq     'API Support'
      expect(subject.contact.url).to eq      'http://www.example.com/support'
      expect(subject.contact.email).to eq    'apiteam@swagger.io'
      expect(subject.license.name).to eq     'Apache 2.0'
      expect(subject.license.url).to eq      'http://www.apache.org/licenses/LICENSE-2.0.html'
    end
  end

  describe '.info' do
    subject { dummy_class.info }

    it 'should return info options' do
      is_expected.to eq SimpleSwaggerDocs::V3::Info::Info
    end
  end
end
