import { Controller } from "@hotwired/stimulus";
// import { Chart } from "chart.js";

export default class extends Controller {
  static targets = ["artist"]
  static values = {
    labels: Array,
    data: Array,
  }
  connect() {
    this.loadArtist();

  }

  loadArtist() {
    Chart.defaults.color = '#FFF';
    // Replace this with your actual data and chart configuration
    const sortedData = this.labelsValue.map((label, index) => ({
      label: label,
      value: this.dataValue[index],
    }));

    // Sort the data array by the value in descending order
    sortedData.sort((a, b) => b.value - a.value);

    const sortedLabels = sortedData.map(item => item.label);
    const sortedDataValues = sortedData.map(item => item.value);

    // Limit the chart to the top 5 genres
    const top5Labels = sortedLabels.slice(0, 5);
    const top5DataValues = sortedDataValues.slice(0, 5);

    const data = {
      labels: top5Labels,
      datasets: [
        {
          label: "Number of posts",
          data: top5DataValues,
          backgroundColor: ["rgba(191, 44, 113, 0.2)", "rgba(4, 13, 191, 0.2)", "rgba(97, 165, 78, 0.2)"],
          borderColor: ["rgba(191, 44, 113, 1.0)", "rgba(4, 13, 191, 1.0)", "rgba(97, 165, 78, 1.0)"],
          borderWidth: 5,
          borderRadius: 5
        },
      ],
    };

    const config = {
      type: "bar",
      data: data,
      options: {
        scales: {
          x: {
            beginAtZero: true,
            title: {
              display: true,
              text: "Artists",
            },
          },
          y: {
            beginAtZero: true,
            title: {
              display: true,
              text: "No. of posts",
            },
          },
        },
      },
    };

    const ctx = this.artistTarget
    new Chart(ctx, config);
  }


}
