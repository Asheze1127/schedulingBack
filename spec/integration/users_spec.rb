require 'swagger_helper'

RSpec.describe 'Users API', type: :request do
  path '/api/v1/users' do
    get 'list users' do
      tags 'Users'
      produces 'application/json'

      response '200', 'successful' do
        run_test!
      end
    end
  end
end
