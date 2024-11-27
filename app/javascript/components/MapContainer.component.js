import React from "react";
import { APIProvider, Map } from "@vis.gl/react-google-maps";
import { InfoWindow } from "./InfoWindow.component";
import { MarkerList } from "./MarkerList.component";

export function MapContainer({
  markers,
  selectedMarker,
  onMarkerClick,
  onClose,
}) {
  const API_KEY = window.ENV.API_KEY;
  const SANTIAGO_COORDINATES = { lat: -33.45694, lng: -70.64827 };

  return (
    <APIProvider apiKey={API_KEY}>
      <Map
        style={{ width: "70vw", height: "70vh" }}
        defaultCenter={SANTIAGO_COORDINATES}
        defaultZoom={10}
        gestureHandling={"greedy"}
        mapId={"DEMO_MAP_ID"}
      >
        <MarkerList markers={markers} onMarkerClick={onMarkerClick} />
        {selectedMarker && (
          <InfoWindow marker={selectedMarker} onClose={onClose} />
        )}
      </Map>
    </APIProvider>
  );
}
