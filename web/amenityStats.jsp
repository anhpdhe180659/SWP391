<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-md-6">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Room Amenity Status Statistics</h4>
            </div>
            <div class="card-body">
                <canvas id="amenityStatsChart"></canvas>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var ctx = document.getElementById('amenityStatsChart').getContext('2d');
    
    console.log('Normal:', ${maintenanceStats['Normal'] != null ? maintenanceStats['Normal'] : 0});
    console.log('Maintenance:', ${maintenanceStats['Maintenance'] != null ? maintenanceStats['Maintenance'] : 0});
    console.log('Broken:', ${maintenanceStats['Broken'] != null ? maintenanceStats['Broken'] : 0});
    
    var stats = {
        labels: [
            'Normal Rooms',
            'Rooms Needing Maintenance',
            'Rooms with Broken Amenities'
        ],
        datasets: [{
            data: [
                ${maintenanceStats['Normal'] != null ? maintenanceStats['Normal'] : 0},
                ${maintenanceStats['Maintenance'] != null ? maintenanceStats['Maintenance'] : 0},
                ${maintenanceStats['Broken'] != null ? maintenanceStats['Broken'] : 0}
            ],
            backgroundColor: [
                '#2ecc71', // green for normal
                '#f1c40f', // yellow for maintenance
                '#e74c3c'  // red for broken
            ]
        }]
    };

    if (stats.datasets[0].data.some(value => value > 0)) {
        new Chart(ctx, {
            type: 'pie',
            data: stats,
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom'
                    },
                    title: {
                        display: true,
                        text: 'Room Amenity Status Distribution'
                    }
                }
            }
        });
    } else {
        ctx.font = '14px Arial';
        ctx.fillStyle = '#666';
        ctx.textAlign = 'center';
        ctx.fillText('No data available', ctx.canvas.width / 2, ctx.canvas.height / 2);
    }
});
</script>