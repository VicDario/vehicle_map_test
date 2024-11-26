import { Controller } from "@hotwired/stimulus";
import React, { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import Show from "../views/show.view";

// Connects to data-controller="react"
export default class extends Controller {
  connect() {
    const app = document.getElementById("app");
    createRoot(app).render(
      <StrictMode>
        <Show />
      </StrictMode>
    );
  }
}
