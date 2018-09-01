require 'spec_helper'

RSpec.describe SimpleSwaggerDocs::V3::Tags do
  let(:dummy_class) do
    class Dummy
      extend SimpleSwaggerDocs::V3::OpenAPI
      extend SimpleSwaggerDocs::V3::Tags
    end
  end

  describe 'attributes' do
    subject { dummy_class.tags }

    it 'should return tag objects' do
      expect(subject.size).to                         eq 3
      expect(subject[0].name).to                      eq 'pet'
      expect(subject[0].description).to               eq 'Everything about your Pets'
      expect(subject[0].external_docs.description).to eq 'Find out more'
      expect(subject[0].external_docs.url).to         eq 'http://swagger.io'
      expect(subject[1].name).to                      eq 'store'
      expect(subject[1].description).to               eq 'Access to Petstore orders'
      expect(subject[2].name).to                      eq 'user'
      expect(subject[2].description).to               eq 'Operations about user'
      expect(subject[2].external_docs.description).to eq 'Find out more about our store'
      expect(subject[2].external_docs.url).to         eq 'http://swagger.io'
    end
  end
end
