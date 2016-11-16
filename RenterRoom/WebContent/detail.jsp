<%@page import="FileUtils.DateUtils"%>
<%@page import="bean.Rooms"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="templates/public/inc/public/header.jsp" %>
<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
            width: 46%;
		    height: 200px;
		    margin-left: 72px;
		    position: relative;
		    overflow: hidden;
		    float: right;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      .controls {
        margin-top: 10px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #pac-input {
        background-color: #fff;
        font-family: Roboto;
        font-size: 15px;
        font-weight: 300;
        margin-left: 12px;
        padding: 0 11px 0 13px;
        text-overflow: ellipsis;
        width: 300px;
      }

      #pac-input:focus {
        border-color: #4d90fe;
      }

      .pac-container {
        font-family: Roboto;
      }

      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Roboto;
        font-size: 13px;
        font-weight: 300;
      }
      #target {
        width: 345px;
      }
    </style>
    <script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyATCZoRt0YL7vyORh_QTEA09wE393lem2E
    &callback=initAutocomplete&libraries=places" async defer></script>
    <script>
    function initAutocomplete() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -33.8688, lng: 151.2195},
          /* zoom: 4,
          mapTypeId: 'roadmap' */
          zoom: 13,
          disableDefaultUI: true,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        // Create the search box and link it to the UI element.
        var input  =  document.getElementById('pac-input'),
        ac  = new google.maps.places.SearchBox(input),
        itemsloaded =  google.maps.event
                          .addDomListener(document.body,
                                          'DOMNodeInserted',
                                          function(e){ 
                            if(e.target.className==='pac-item'){
                              //remove the listener
                              google.maps.event.removeListener(itemsloaded);
                              //trigger the events
                              google.maps.event.trigger( input, 'keydown', {keyCode:40})
                              google.maps.event.trigger( input, 'keydown', {keyCode:13})
                              google.maps.event.trigger( input, 'focus')
                              google.maps.event.trigger( input, 'keydown', {keyCode:13})
                            }
                          });
						  
        var searchBox = new google.maps.places.SearchBox(input);
        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        // Bias the SearchBox results towards current map's viewport.
        map.addListener('bounds_changed', function() {
          searchBox.setBounds(map.getBounds());
        });

        var markers = [];
        // Listen for the event fired when the user selects a prediction and retrieve
        // more details for that place.
        searchBox.addListener('places_changed', function() {
          var places = searchBox.getPlaces();

          if (places.length == 0) {
            return;
          }

          // Clear out the old markers.
          markers.forEach(function(marker) {
            marker.setMap(null);
          });
          markers = [];

          // For each place, get the icon, name and location.
          var bounds = new google.maps.LatLngBounds();
          places.forEach(function(place) {
            if (!place.geometry) {
              console.log("Returned place contains no geometry");
              return;
            }
            var icon = {
              url: place.icon,
              size: new google.maps.Size(71, 71),
              origin: new google.maps.Point(0, 0),
              anchor: new google.maps.Point(17, 34),
              scaledSize: new google.maps.Size(25, 25)
            };

            // Create a marker for each place.
            markers.push(new google.maps.Marker({
              map: map,
              icon: icon,
              title: place.name,
              position: place.geometry.location
            }));

            if (place.geometry.viewport) {
              // Only geocodes have viewport.
              bounds.union(place.geometry.viewport);
            } else {
              bounds.extend(place.geometry.location);
            }
          });
          map.fitBounds(bounds);
        });
      }
    </script>
<!--start main -->
<div class="main_bg">
<div class="wrap">
	<div class="main">
		<div class="details">
		<%
			Rooms alRooms=(Rooms)request.getAttribute("alRooms");
				
		%>
			<h2><%=alRooms.getNameRoom() %></h2>
			<div class="det_pic">
				  <img style="width:46%;" src="<%=request.getContextPath()%>/templates/public/images/det_pic.jpg" alt="" />
				  <input id="pac-input" class="controls" type="hidden" placeholder="Search Box" value="<%=alRooms.getAddress()%>">
				  <div id="map" ></div>
			</div>
			<div class="det_text">
				<p class="para">Địa điểm: <span><%=alRooms.getStreet() %>g</span> </p>
				<p class="para"><%=alRooms.getDescription() %> </p>
				<p class="para">Tiền phòng: <span><%=alRooms.getCost() %> VNĐ</span> </p>
				<p class="para">Thời gian cập nhật: <span><%=DateUtils.formatDate(alRooms.getTimeCreated())%></span></p>
				<div class="read_more">
					 <a href="<%=request.getContextPath()%>/Public_BookingRoom?idRoom=<%=alRooms.getIdRoom()%>" name="submit">Đặt phòng</a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>	
<%@include file="templates/public/inc/public/footer.jsp" %>	