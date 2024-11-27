import React, { useCallback } from "react";
import { InfoWindow as InfoWindowGoogle } from "@vis.gl/react-google-maps";

export function InfoWindow({ marker, onClose }) {
  const formatDate = useCallback((date) => {
    if (!date) return "";

    const d = new Date(date);
    if (isNaN(d)) return "Invalid date";

    const day = String(d.getDate()).padStart(2, "0");
    const month = String(d.getMonth() + 1).padStart(2, "0");
    const year = d.getFullYear(); // Get year
    const hours = String(d.getHours()).padStart(2, "0");
    const minutes = String(d.getMinutes()).padStart(2, "0");

    return `${day}/${month}/${year} ${hours}:${minutes}`;
  }, []);

  return (
    <InfoWindowGoogle
      position={{
        lat: marker.latitude,
        lng: marker.longitude,
      }}
      headerContent={<h4>Vehicle Details:</h4>}
      onClose={onClose}
    >
      <p>
        Identifier: <strong>{marker.vehicle_identifier}</strong>
      </p>
      <p>
        latitude: <strong>{marker.longitude}</strong>
      </p>
      <p>
        longitude: <strong>{marker.latitude}</strong>
      </p>
      <p>
        Updated at: <strong>{formatDate(marker.sent_at)}</strong>
      </p>
    </InfoWindowGoogle>
  );
}
