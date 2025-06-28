source "https://rubygems.org"

ruby "3.2.3"

gem "rails", "~> 7.1.5", ">= 7.1.5.1"
gem "sqlite3", ">= 1.4"
# gem "pg", "~>1.5"
gem "puma", ">= 5.0"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "rack-cors"
gem "rswag-api"       # ← グループ外に移動
gem "rswag-specs"     # ← グループ外に移動
gem "rswag-ui"        # Swagger UI（本番で使うならここ）

# Windows用のタイムゾーンデータ
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "rspec-rails"
end
