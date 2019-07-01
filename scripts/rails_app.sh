#!/bin/bash

rails new $1 -d postgresql --skip-sprockets --skip-coffee --skip-test --skip-turbolinks --webpack=vue

cd $1

echo -e 'web: bundle exec rails s\nwebpacker: ./bin/webpack-dev-server' > Procfile.dev
echo -e '#!/bin/bash\n\nforeman start -f Procfile.dev' > bin/up
chmod +x bin/up
bundle add redis devise name_of_person rack-mini-profiler flamegraph stackprof memory_profiler active_model_serializers pundit bullet rack-attack
bundle add foreman rspec-rails pry rubocop rubocop-rails factory_bot_rails capybara chromedriver-helper selenium-webdriver shoulda-matchers dotenv-rails --group "development, test"
rails db:create && rails db:migrate
rails generate rspec:install
rails generate devise:install
rails generate devise User
rails g devise:views
yarn add tailwindcss
mkdir app/javascript/css

echo -e '@tailwind tailwindcss/base;\n\n@tailwind tailwindcss/components;\n\n@tailwind tailwindcss/utilities;' > app/javascript/css/application.css

sed -i '/  plugins: \[/a \ \ \ \ require('\''tailwindcss'\''),' postcss.config.js
