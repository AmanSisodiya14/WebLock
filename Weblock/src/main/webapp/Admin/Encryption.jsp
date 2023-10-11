<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Purple Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../assets/vendor/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../assets/vendor/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../assets/ADcss/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="../assets/ADimages/favicon.ico" />
  </head>
  <body>
    <div class="container-scroller">
      <!-- partial:../../partials/_navbar.html -->
      <jsp:include page="../ExtraFiles/ADNavBar.jsp"></jsp:include>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
       <jsp:include page="../ExtraFiles/ADSideNav.jsp"></jsp:include>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
          
      
      <div class="row">
        <div class="col-lg-6 grid-margin stretch-card">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">Line chart</h4>
              <canvas id="myChart" style="height: 250px;"></canvas>
            </div>
          </div>
        </div>

        <div class="col-lg-6 grid-margin stretch-card">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title">Line chart</h4>
              <canvas id="myChart2" style="height: 250px;"></canvas>
            </div>
          </div>
        </div>
      </div>

          </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.html -->
          <footer class="footer">
            <div class="container-fluid d-flex justify-content-between">
              <span class="text-muted d-block text-center text-sm-start d-sm-inline-block">Copyright © bootstrapdash.com 2021</span>
              <span class="float-none float-sm-end mt-1 mt-sm-0 text-end"> Free <a href="https://www.bootstrapdash.com/bootstrap-admin-template/" target="_blank">Bootstrap admin template</a> from Bootstrapdash.com</span>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../assets/vendor/ADjs/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../assets/ADjs/off-canvas.js"></script>
    <script src="../assets/ADjs/hoverable-collapse.js"></script>
    <script src="../assets/ADjs/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.min.js"></script>
    <script>

        const ctx = document.getElementById('myChart');
      
        new Chart(ctx, {
          type: 'polarArea',
          data: {
            labels: ['AES', 'Hash', 'DES', 'Triple DES', 'Password Protection'],
            datasets: [{
              label: 'Usage',
              data: [12, 19, 3, 5, 2],
              borderWidth: 1
            }]
          },
          options: {
            scales: {
              y: {
                beginAtZero: true
              }
            }
          }
        });
        const ctx2 = document.getElementById('myChart2');
      
        new Chart(ctx2, {
          type: 'bar',
          data: {
            labels: ['AES', 'Hash', 'DES', 'Triple DES', 'Password Protection'],
            datasets: [{
              label: 'Usage',
              data: [12, 19, 3, 5, 2],
              borderWidth: 1
            }]
          },
          options: {
            scales: {
              y: {
                beginAtZero: true
              }
            }
          }
        });
      </script>
  </body>
</html>