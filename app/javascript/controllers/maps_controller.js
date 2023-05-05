import { Controller } from "@hotwired/stimulus"
import L from 'leaflet';

export default class extends Controller {
  static targets = ["container"]

  connect() {
    let coords = JSON.parse(this.containerTarget.dataset.coordinates);

    if (coords.length > 0) {
      let map = L.map(this.containerTarget).setView(coords[0], 11.5);

      L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
      }).addTo(map);

      coords.map((coord) => {
        L.marker(coord).addTo(map)
      })
    }
  }

  disconnect() {
    this.map.remove();
  }
}
