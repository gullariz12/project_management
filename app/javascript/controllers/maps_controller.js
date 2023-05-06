import { Controller } from "@hotwired/stimulus"
import L from 'leaflet';
import * as GeoSearch from "leaflet-geosearch"

export default class extends Controller {
  static targets = ["container", "address"]

  connect() {
    let coords = this.containerTarget.dataset.coordinates;
    if(coords) {
      coords = JSON.parse(this.containerTarget.dataset.coordinates);
    } else {
      coords = [[31.5656822, 74.3141829]];
    }

    if (coords.length > 0) {
      let map = L.map(this.containerTarget).setView(coords[0], 11.5);
      let provider = new GeoSearch.OpenStreetMapProvider();

      L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
      }).addTo(map);

      coords.map((coord) => {
        L.marker(coord).addTo(map)
      });

      if (this.addressTarget) {
        const search = new GeoSearch.GeoSearchControl({
          style: 'bar',
          provider: provider,
          marker: {
            draggable: false,
          },
        });

        map.addControl(search);

        map.on('geosearch/showlocation', (event) => {
          this.addressTarget.value = event.location.label
        });

        if (this.addressTarget.value.length > 0) {
          let query = { query: this.addressTarget.value }

          provider.search(query).then((result) => {
            search.showResult(result[0], query)
          });

          search.searchElement.input.value = this.addressTarget.value
        }
      }
    }
  }

  disconnect() {
    this.map.remove();
  }
}
