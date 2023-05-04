import { Controller } from "@hotwired/stimulus"
import { patch } from "@rails/request.js";

export default class extends Controller {
  static values = { url:String }

  connect() {
    $(this.element).select2();
    $(this.element).on("select2:select", (event) => this.assign(event));
  }

  assign(event){
    patch(this.urlValue, {
      body: { user_id: event.target.value },
      responseKind: "turbo-stream",
      traditional: true
    })
  }
}
