var map = L.map('mapid').on('load', onMapLoad).setView([41.4, 2.206], 9);
//map.locate({setView: true, maxZoom: 17});

var tiles = L.tileLayer(
  'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
  {}
).addTo(map);

//en el clusters almaceno todos los markers
var markers = L.markerClusterGroup();
var data_markers = [];

function onMapLoad() {
  console.log('Mapa cargado');

  // FASE 3.1
  // 1) Relleno el data_markers con una petición a la api
  fetch('http://localhost/mapa/api/apiRestaurants.php')
    .then(function (response) {
      return response.json();
    })
    .then(function (restaurants) {
      data_markers = restaurants;

      // 2) Añado de forma dinámica en el select los posibles tipos de restaurantes
      fillSelectValues(restaurants);

      // 3) Llamo a la función para --> render_to_map(data_markers, 'all'); <-- para mostrar restaurantes en el mapa
      render_to_map(data_markers, 'all');
    });
}

$('#kind_food_selector').on('change', function () {
  console.log(this.value);
  render_to_map(data_markers, this.value);
});

function fillSelectValues(restaurants) {
  const selectRestaurant = document.getElementById('kind_food_selector');
  const foodTypes = [];

  restaurants.forEach((restaurant) => {
    if (!foodTypes.includes(restaurant.kind_food)) {
      const option = document.createElement('option');
      option.setAttribute('value', restaurant.kind_food);
      option.innerText = restaurant.kind_food;

      selectRestaurant.appendChild(option);

      foodTypes.push(restaurant.kind_food);
    }
  });
}

function render_to_map(data_markers, filter) {
  // 1) Limpio todos los marcadores
  if (markers.getLayers() && markers.getLayers().length > 0) {
    markers.getLayers().forEach((layer) => markers.removeLayer(layer));
  }

  // 2) Realizo un bucle para decidir que marcadores cumplen el filtro, y los agregamos al mapa
  data_markers.forEach((data) => {
    if (filter === 'all' || data.kind_food === filter) {
      const restaurantMarker = L.marker([data.lat, data.lng]).bindPopup(
        `<div>
          <img width="250" src="./img/${data.photo}" />
          <div>
            <h4>${data.name}</h4>
            <small>${data.kind_food}</small>     
            <p>${data.address}</p>
          </div>
        </div>`
      );
      markers.addLayer(restaurantMarker);
    }
  });

  map.addLayer(markers);
}
