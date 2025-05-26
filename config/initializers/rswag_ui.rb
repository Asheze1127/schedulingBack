Rswag::Ui.configure do |c|
  # 古い方法：c.swagger_endpoint '/api-docs/v1/swagger.yaml', 'API Docs'
  c.openapi_endpoint '/api-docs/v1/openapi.yaml', 'API Docs'
end

