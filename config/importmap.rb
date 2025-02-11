# Pin npm packages by running ./bin/importmap

# pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/ujs", to: "https://cdn.jsdelivr.net/npm/@rails/ujs@7.0.4/lib/assets/compiled/rails-ujs.js"
pin "application", to: "application.js", preload: true

pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js"
pin "tailwindcss", to: "https://cdn.skypack.dev/tailwindcss"
