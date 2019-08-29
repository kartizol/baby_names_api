require 'rails_helper'

RSpec.describe Api::V1::NameListsController, type: :request do
  describe 'GET #show' do
    let!(:name_list) { create(:name_list) }
    let(:name_list_code) { name_list.code }
    let(:version) { 'application/vnd.babynames+json;version=1' }
    let(:headers) { { 'HTTP_ACCEPT' => version } }

    before {
      get api_name_list_path(code: name_list_code), headers: headers
    }

    context 'when name list exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the name list' do
        expect(json).not_to be_empty
        expect(json['code']).to eq(name_list_code)
      end
    end

    context 'when name list does not exist' do
      let(:name_list_code) { SecureRandom.hex(5).downcase }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found error' do
        expect(json['error']['title']).to match('Not Found')
      end
    end
  end

  describe 'POST #create' do
    context 'when the request is valid' do
      before {
        post api_name_lists_path(), headers: headers
      }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'creates a name list' do
        expect(json['code']).not_to be_empty
        expect(json['code'].length).to be(12)
      end
    end
  end
end
