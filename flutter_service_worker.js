'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"main.dart.js": "35b3328b82ef446a4f67911c4135db90",
"assets/AssetManifest.json": "36d39281cb9d2be1fcb724e2bc7daad7",
"assets/assets/images/paula/logoMarca.jpeg": "c6307aa9dae6502896c628bd377e9b31",
"assets/assets/images/paula/logoMarca2.png": "2361d881b35aee58cd31dfcc35ec38dc",
"assets/assets/images/paula/favicon.png": "919882bd3a5d9ec04e67b1fce2b7575f",
"assets/assets/images/paula/perfil.jpg": "e3aafd8726a2c281f9648257451a055a",
"assets/assets/images/paula/logoMarcaT.png": "bff2af3036b47adf4353b097d7105add",
"assets/assets/images/paula/vacina.jpg": "0c7487b1988f7de420de2a2299a1b80e",
"assets/assets/images/paula/paulaMesa.jpg": "118d11444d12c7b77474d91a4989f123",
"assets/assets/images/paula/mao.jpg": "31c1eb749a2e30e7dad77989f30659d2",
"assets/assets/images/servi%25C3%25A7os/botox2.jpg": "71756feb4bf42bfc80d30606e8dbe82b",
"assets/assets/images/servi%25C3%25A7os/bioestimuladores.jpg": "b3c38a9fbdbca7b81c5f833027981750",
"assets/assets/images/servi%25C3%25A7os/bichectomia.jpg": "fae680cd805fe2f8bdc705912fa4b488",
"assets/assets/images/servi%25C3%25A7os/microagulhamento2.jpg": "d47d46ec7e54318ba925814aaafa4786",
"assets/assets/images/servi%25C3%25A7os/pdo.jpg": "d885be460f9ab340a8109a6e4a279140",
"assets/assets/images/servi%25C3%25A7os/pdo2.jpg": "73582a8112db3a4d32e36da85e6edf93",
"assets/assets/images/servi%25C3%25A7os/preenchimento2.jpg": "3a14cc987917e86dc36ca40f25a3e5ea",
"assets/assets/images/servi%25C3%25A7os/bichectomia2.jpg": "d8514d7181af3c94df9992b63496390b",
"assets/assets/images/servi%25C3%25A7os/peeling2.jpg": "41fbdb069f322fbbab64bf97de1d1cf8",
"assets/assets/images/servi%25C3%25A7os/microagulhamento.jpg": "5ee5bbe2169ae214f7dcc44793b16bc5",
"assets/assets/images/servi%25C3%25A7os/lipopapada.png": "4d893242e5bd764c9766f7825599b8fb",
"assets/assets/images/servi%25C3%25A7os/peeling.jpg": "63248ddd2e26e96f4df28d50a200a592",
"assets/assets/images/servi%25C3%25A7os/Preenchimento.jpg": "7d99b0feee44c963c113f8956cf8dca3",
"assets/assets/images/servi%25C3%25A7os/bioestimuladores2.jpg": "f6cb1bafd9abc3378ef987021d17ff78",
"assets/assets/images/servi%25C3%25A7os/botox.png": "62cff0c357ef980350d089bbc240661a",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "dd3c4233029270506ecc994d67785a37",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "613e4cc1af0eb5148b8ce409ad35446d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "d1722d5cf2c7855862f68edb85e31f88",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/NOTICES": "82bdafbc3f89fe6f12d767b70d884545",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"index.html": "6018939535be4aaaebe253d5516be054",
"/": "6018939535be4aaaebe253d5516be054",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "6b8209c97ebfa280edc293a29a48db5b",
"manifest.json": "32965a72077025391c8e792a0fb4ef73",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
