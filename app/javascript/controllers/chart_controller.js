import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    labels: Array,
    data: Array
  }
  connect() {
    this.loadGenre();
    console.log(this.labelsValue);
    console.log(this.dataValue);

  }

  loadGenre() {
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
          label: "Todays top genres",
          data: top5DataValues,
          backgroundColor: ["rgba(75, 192, 192, 0.2)", "rgba(255, 99, 132, 0.2)", "rgba(255, 206, 86, 0.2)"],
          borderColor: ["rgba(75, 192, 192, 1)", "rgba(255, 99, 132, 1)", "rgba(255, 206, 86, 1)"],
          borderWidth: 1,
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
              text: "Genres",
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

    const ctx = document.getElementById("myChart").getContext("2d");
    new Chart(ctx, config);
  }



}
