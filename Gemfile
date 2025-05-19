source "https://rubygems.org"

ruby "3.2.3"

gem "rails", "~> 7.1.5", ">= 7.1.5.1"
gem "sqlite3", ">= 1.4"
gem "puma", ">= 5.0"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "rack-cors"
gem "rswag-ui" # 本番で Swagger UI を提供するならここでOK

# Windows用のタイムゾーンデータ
gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem "rspec-rails"
  gem "rswag-api"
  gem "rswag-specs"
end

# ↓ spring は必要なら有効化（任意）
# group :development do
#   gem "spring"
# end
