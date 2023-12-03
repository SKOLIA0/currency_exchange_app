import { Controller } from "@hotwired/stimulus"
import * as d3 from 'd3';
import c3 from "c3";

export default class extends Controller {
    static values = {
        chartData: Object
    }

    connect() {
        if (this.chartDataValue) {
            this.initializeChart();
        }
    }

    initializeChart() {
        const chartData = this.chartDataValue;
        // console.log("ChartDataX:", chartData.x);
        if (document.getElementById('chart')) {
          c3.generate({
                bindto: '#chart',
                data: {
                    x: 'date',
                    columns: [
                        chartData.x,
                        chartData.usd,
                        chartData.eur,
                        chartData.cny
                    ],

                },
                axis: {
                    x: {
                        type: 'timeseries',
                        tick: {
                            format: '%Y-%m-%d'
                        }
                    }
                }
            });
        } else {
            console.error("Element #chart not found");
        }
    }
}
