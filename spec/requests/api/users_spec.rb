# spec/requests/api/users_spec.rb
require 'swagger_helper'
require 'rails_helper'


RSpec.describe 'Users API', type: :request do
  path '/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: ['name', 'email', 'password']
      }

      response '201', 'user created' do
        let(:user) { { name: 'Taro', email: 'taro@example.com', password: 'password123' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: '' } }
        run_test!
      end
    end
  end
end
