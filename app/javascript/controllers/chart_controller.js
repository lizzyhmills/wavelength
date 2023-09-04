import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.loadChart();
  }

  loadChart() {
    // Replace this with your actual data and chart configuration
    const data = {
      labels: ["Label 1", "Label 2", "Label 3"],
      datasets: [
        {
          label: "Dataset",
          data: [10, 20, 30],
          backgroundColor: ["rgba(75, 192, 192, 0.2)", "rgba(255, 99, 132, 0.2)", "rgba(255, 206, 86, 0.2)"],
          borderColor: ["rgba(75, 192, 192, 1)", "rgba(255, 99, 132, 1)", "rgba(255, 206, 86, 1)"],
          borderWidth: 1,
        },
      ],
    };

    const config = {
      type: "bar", // Replace with the desired chart type (e.g., bar, line, pie)
      data: data,
    };

    const ctx = document.getElementById("myChart").getContext("2d");
    new Chart(ctx, config);
  }
}
