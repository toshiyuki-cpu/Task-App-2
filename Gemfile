source 'https://rubygems.org'

gem 'rails',        '~> 5.1.6'
gem 'bcrypt'
gem 'faker'
gem 'bootstrap-sass'
gem 'puma',         '~> 3.7'
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.5'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'better_errors' # エラー画面をわかりやすく整形してくれる
  gem 'binding_of_caller' # better_errorsの画面上にirb/pry(PERL)を表示する
  gem 'pry-rails' # binding.pry使えるようになる
  gem 'pry-byebug' # binding.pry で止めたところからステップ実行ができる
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
# Mac環境でもこのままでOKです
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
