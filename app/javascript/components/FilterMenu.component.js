import React, { useState } from "react";

export function FilterMenu({ onSubmit, currentFilter, onClear }) {
  const [filterValue, setFilterValue] = useState(currentFilter);

  const handleSubmit = (event) => {
    event.preventDefault();
    onSubmit(filterValue);
  };

  return (
    <form onSubmit={handleSubmit} className="container">
      <div className="row mt-3">
        <div className="offset-1 col-3">
          <label htmlFor="filter" className="form-label">
            Filter by Vehicle identifier:
          </label>
        </div>
        <div className="col-2">
          <input
            className="form-control"
            type="text"
            name="filter"
            value={filterValue}
            onChange={(e) => setFilterValue(e.target.value)}
          />
        </div>
        <div className="col-1">
          <button type="submit" className="btn btn-primary mb-3">
            Filter
          </button>
        </div>
        {currentFilter && (
          <div className="col-4 d-flex align-items-center">
            <p className="m-0">Currently filtering by {currentFilter}</p>
            <button onClick={onClear} className="btn btn-danger ms-2">
              Clean
            </button>
          </div>
        )}
      </div>
    </form>
  );
};
