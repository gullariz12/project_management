// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"
import {far} from "@fortawesome/free-regular-svg-icons"
import {fas} from "@fortawesome/free-solid-svg-icons"
import {fab} from "@fortawesome/free-brands-svg-icons"
import {library} from "@fortawesome/fontawesome-svg-core"
import "@fortawesome/fontawesome-free"
import toastr from "toastr"
import jquery from "jquery"
import "@nathanvda/cocoon"
import select2 from "select2"

library.add(far, fas, fab)
window.toastr = toastr
window.jQuery = jquery
window.$ = jquery
window.select2 = select2();
