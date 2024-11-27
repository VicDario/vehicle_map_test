import React from "react";
import { AdvancedMarker } from "@vis.gl/react-google-maps";

export const MarkerList = ({ markers, onMarkerClick }) => (
  <>
    {markers.length &&
      markers.map((marker) => (
        <AdvancedMarker
          key={marker.vehicle_identifier}
          position={{ lat: marker.latitude, lng: marker.longitude }}
          title={marker.vehicle_identifier}
          onClick={() => onMarkerClick(marker)}
        />
      ))}
  </>
);
