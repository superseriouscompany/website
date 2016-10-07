'use strict';

self.addEventListener('install', function(event) {
  console.log("Installed", event);
})

self.addEventListener('activate', function(event) {
  console.log("Activated", event);
})

self.addEventListener('push', function(event) {
  console.log("Push message", event);

  var title = 'Push message';

  event.waitUntil(
    self.registration.showNotification(title, {
      body: `The Message ${Math.random()}`,
      icon: 'images/icon.png',
      tag: 'newComic'
    })
  )
})
