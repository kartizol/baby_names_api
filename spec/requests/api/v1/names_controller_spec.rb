require 'rails_helper'

RSpec.describe Api::V1::NamesController, type: :request do
  let!(:name_list) { create(:name_list) }
  let!(:names) { create_list(:name, 10, name_list: name_list) }
  let(:name_list_code) { name_list.code }
  let(:name_id) { names.first.id }
  let(:version) { 'application/vnd.babynames+json;version=1' }
  let(:headers) { { 'HTTP_ACCEPT' => version } }

  describe 'GET #index' do
    before {
      get api_name_list_names_path(name_list_code: name_list_code), headers: headers
    }

    context 'when names exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all names' do
        expect(json.size).to eq(10)
      end
    end

    context 'when names does not exist' do
      let(:name_list_code) { '0000000000' }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found error' do
        expect(json['error']['title']).to match('Not Found')
      end
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { name: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
                               crossed_out: false } }

    context 'when request attributes are valid' do
      before {
        post api_name_list_names_path(name_list_code: name_list_code),
             params: valid_attributes,
             headers: headers
      }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before {
        post api_name_list_names_path(name_list_code: name_list_code),
             params: {},
             headers: headers
      }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(json['error']['title']).to match('Unprocessable Entity')
      end
    end

    context 'when an invalid name list' do
      before {
        post api_name_list_names_path(name_list_code: '0000000000'),
             params: valid_attributes,
             headers: headers
      }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found error' do
        expect(json['error']['title']).to match('Not Found')
      end
    end

    context 'when and name already exists' do
      it 'returns status code 422' do
        post api_name_list_names_path(name_list_code: name_list_code),
             params: valid_attributes,
             headers: headers
        post api_name_list_names_path(name_list_code: name_list_code),
             params: valid_attributes,
             headers: headers

        expect(json['error']['title']).to match('Unprocessable Entity')
        expect(json['error']['detail']).to match('Validation failed: Name has already been taken')
      end
    end
  end

  describe 'PUT #update' do
    let(:valid_attributes) { { crossed_out: true } }

    before {
      put api_name_list_name_path(name_list_code: name_list_code, id: name_id),
          params: valid_attributes,
          headers: headers
    }

    context 'when name exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the name' do
        updated_name = Name.find(name_id)
        expect(updated_name.crossed_out).to match(true)
      end
    end

    context 'when name does not exist' do
      let(:name_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(json['error']['title']).to match('Not Found')
      end
    end
  end
end
