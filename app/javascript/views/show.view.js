import React, { useEffect, useState } from "react";
import { APIProvider, Map, Marker } from "@vis.gl/react-google-maps";

const API_KEY = "AIzaSyAOENdP8nSgl08r3Xo6ik1pZ1U3_GjdSi4";

export default function Show() {
  const [positions, setPositions] = useState([]);
  useEffect(() => {
    fetch("/api/v1/gps/latest")
      .then((response) => response.json())
      .then(setPositions);
  }, []);
  return (
    <APIProvider apiKey={API_KEY}>
      <Map
        style={{ width: "100vw", height: "100vh" }}
        defaultCenter={{ lat: 22.54992, lng: 0 }}
        defaultZoom={3}
        gestureHandling={"greedy"}
        disableDefaultUI={true}
      >
        {positions.length &&
          positions.map((position) => (
            <Marker
              key={position.vehicle_identifier}
              position={{ lat: position.latitude, lng: position.longitude }}
            />
          ))}
      </Map>
    </APIProvider>
  );
}
