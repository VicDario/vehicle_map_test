import React, { useEffect, useState, useCallback, useRef } from "react";
import { FilterMenu } from "../components/FilterMenu.component";
import { MapContainer } from "../components/MapContainer.component";

export default function Show() {
  const [markers, setMarkers] = useState([]);
  const [selectedMarker, setSelectedMarker] = useState(null);
  const [currentFilter, setCurrentFilter] = useState("");
  const markersMemory = useRef([]);

  useEffect(() => {
    fetch("/api/v1/gps/latest")
      .then((response) => response.json())
      .then((markersData) => {
        setMarkers(markersData);
        markersMemory.current = markersData;
      });
  }, []);

  const handleWindowInfoClose = useCallback(() => setSelectedMarker(null), []);

  const handleMarkerClick = useCallback((market) => setSelectedMarker(market), []);

  const onSubmit = useCallback((filter) => {
    const filteredMarkers = markersMemory.current.filter((marker) =>
      marker.vehicle_identifier.includes(filter)
    );
    setMarkers(filteredMarkers);
    setCurrentFilter(filter);
  }, []);

  const cleanFilter = useCallback(() => {
    setMarkers(markersMemory.current);
    setCurrentFilter("");
  }, []);

  return (
    <main className="d-flex justify-content-center align-items-center flex-column">
      <h1>Vehicle Map Test</h1>
      <FilterMenu onSubmit={onSubmit} currentFilter={currentFilter} onClear={cleanFilter} />
      <MapContainer
        markers={markers}
        selectedMarker={selectedMarker}
        onMarkerClick={handleMarkerClick}
        onClose={handleWindowInfoClose}
      />
    </main>
  );
}
