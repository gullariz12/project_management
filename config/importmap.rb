# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'trix'
pin '@rails/actiontext', to: 'actiontext.js'
pin '@fortawesome/fontawesome-free', to: 'https://ga.jspm.io/npm:@fortawesome/fontawesome-free@6.4.0/js/fontawesome.js'
pin '@fortawesome/fontawesome-svg-core', to: 'https://ga.jspm.io/npm:@fortawesome/fontawesome-svg-core@6.4.0/index.mjs'
pin '@fortawesome/free-brands-svg-icons', to: 'https://ga.jspm.io/npm:@fortawesome/free-brands-svg-icons@6.4.0/index.mjs'
pin '@fortawesome/free-regular-svg-icons', to: 'https://ga.jspm.io/npm:@fortawesome/free-regular-svg-icons@6.4.0/index.mjs'
pin '@fortawesome/free-solid-svg-icons', to: 'https://ga.jspm.io/npm:@fortawesome/free-solid-svg-icons@6.4.0/index.mjs'
pin 'toastr', to: 'https://ga.jspm.io/npm:toastr@2.1.4/toastr.js'
pin 'jquery', to: 'https://ga.jspm.io/npm:jquery@3.6.4/dist/jquery.js'
pin "@nathanvda/cocoon", to: "https://ga.jspm.io/npm:@nathanvda/cocoon@1.2.14/cocoon.js"
pin "select2", to: "https://ga.jspm.io/npm:select2@4.1.0-rc.0/dist/js/select2.js"
