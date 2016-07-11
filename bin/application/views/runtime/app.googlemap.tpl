<div class="gmap_container" style="width:100%;height:[{if isset($chartheight)}][{$chartheight}][{else}]300[{/if}]px" id="map_canvas_[{$uniqueid}]"></div> <script>
  var geocoder = null;
  var map = null;
  var uniqueid = '[{$uniqueid}]';

  function initialize() {
    document.getElementById('map_canvas_[{$uniqueid}]').style.display="block";
    
    geocoder = new google.maps.Geocoder();
    var mapOptions = {
      zoom:8,
      center: {lat: -34.397, lng: 150.644}
    };
    map = new google.maps.Map(document.getElementById("map_canvas_[{$uniqueid}]"), mapOptions);
    
    google.maps.event.trigger(map, 'resize');
    [{section name=i loop=$markers}]
    createMarker('[{$markers[i].address}]', "[{$markers[i].title}]", "[{$markers[i].content}]");
    [{sectionelse}]
    if (navigator.geolocation) {
      try {
        navigator.geolocation.getCurrentPosition(setMapCenterToCurrentLocation);
      } catch(e) {
        console.error("Set Map Current Location Failed:");
      }
    } else {
    }
    [{/section}]
  }

  function setMapCenterToCurrentLocation(position) {
    try {
      var coords = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      map.setCenter(position);
    } catch(e) {
      console.error("Set Map Center Position Failed");
    }
  }

  function createMarker(address, title, content) {
    geocoder.geocode( {address:address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        console.log("Create Marker for address: " + address);
        var lat = results[0].geometry.location.lat();
        var lng = results[0].geometry.location.lng();
        var position = {lat: lat, lng: lng};
        map.setCenter(position);
        //place a marker at the location
        var marker = new google.maps.Marker({
          map: map,
          position: position,
          title: title
        });

        var contentString = '<div id="content">'+
          '<div id="siteNotice">'+'</div>'+
          '<h1 id="firstHeading" class="firstHeading">' + title + '</h1>'+
          '<div id="bodyContent">'+ content + '</div>'+
          '</div>';
        var infowindow = new google.maps.InfoWindow({
          content: contentString
        });
        infowindow.open(map, marker);
        google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map, marker);
        });
      } else {
        console.error("Decode address failed: " + address);
      }
    });
  }
  
  function lazyLoadGoogleMap() {
    $.getScript("https://maps.googleapis.com/maps/api/js?key=[{$googleappkey}]&callback=initialize")
    .done(function (script, textStatus) {            
       console.log("Google map script loaded successfully");
    })
    .fail(function (jqxhr, settings, ex) {
      console.log("Could not load Google Map script: " + jqxhr);
    });
  }
  
  $(function() {
    if (window.google && google.maps) {
      initialize();
    } else {
      lazyLoadGoogleMap();
    }
  });
</script>