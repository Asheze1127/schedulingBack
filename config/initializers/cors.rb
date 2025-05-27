Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173'  # Reactの起動URL（Viteのデフォルト）

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true  # 認証情報（Cookieなど）を送る場合はtrue
  end
end
