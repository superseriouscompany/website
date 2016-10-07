'use strict';

self.addEventListener('install', function(event) {
  console.log("Installed", event);
})

self.addEventListener('activate', function(event) {
  console.log("Activated", event);
})

self.addEventListener('push', function(event, foo) {
  var title = 'Push message';

  // var request = new Request('http://localhost:3000/', {mode: 'no-cors'});
  var request = new Request('/dias/current');

  event.waitUntil(
    fetch(request).then(function(response) {
      if( response.status > 299 ) {
        return console.error(response.status, response.json())
      }

      return response.json().then(function(body) {
        return self.registration.showNotification('Super Serious Company', {
          body: body.portuguese_title,
          icon: body.image_url,
          tag: 'newComic'
        })
      })
    }).catch(function(err) {
      console.error('Fetch and notify failed', err);
    })
  )
})
