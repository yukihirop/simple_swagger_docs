require 'spec_helper'

RSpec.describe SimpleSwaggerDocs::V3::OpenAPI do
  let(:dummy_class) do
    class Dummy
      extend SimpleSwaggerDocs::V3::OpenAPI
    end
  end

  describe 'attributes' do
    subject { dummy_class }

    it 'should be set openapi meta' do
      expect(subject.openapi).to eq '3.0.0'
    end
  end
end
