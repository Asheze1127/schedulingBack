# frozen_string_literal: true

require 'rails_helper'       # ← 最初にrails_helper
require 'rswag/specs'        # specs を先に
require 'rswag/api'          # api を後に

Rswag::Api.configure do |c|
  c.swagger_root = Rails.root.to_s + '/swagger'
end

RSpec.configure do |config|
  config.openapi_root = Rails.root.join('swagger').to_s

  config.openapi_specs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: 'http://localhost:3000'
        }
      ]
    }
  }

  config.openapi_format = :yaml
end
