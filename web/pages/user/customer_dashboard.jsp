<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../layout/dashboard/dashboard.css">
    <link rel="stylesheet" href="../../layout/dashboard/customer_dashboard_style.css">
    <link rel="stylesheet" href="../../layout/icon_n_search_bar.css">
    <title>customer dashboard</title>
</head>
<body>
    <header class="dashboard-header">
        <h1>00Aplus - Dashboard</h1>

        <div class="header-right">
          <div><img class="icon" src="../../img/shopping-bag.svg" title="Your Items"/></div>
          <div><img class="icon" src="../../img/profile.svg"  title="Profile" /></div>
          <!-- <div><img class="icon" src="../../img/shopping-bag.svg" title="Your Items"/></div> -->
      </div>
      </header>
      
      <aside class="dashboard-sidebar">
        <button type="button" id="resize">
          &#9776;
        </button>

        <div>
        <nav class="dashboard-nav">
          <ul>
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Orders</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="admin_dashboard.html">admin dash</a></li>
            <li><a href="staff_dashboard.html">staff dash</a></li>
          </ul>
        </nav>
        </div>

      </aside>
      
      
      <main class="dashboard-main">
        <!-- <div class="card card-1"> -->
          <!-- <h2>Manage My Account</h2> -->
        <!-- </div> -->

        <div class="card card-9 customer-profile-card">
          <h2>Manage My Account</h2>
        </div>



        <!-- customer address info -->
        <div class="card card-9">
          <h2>Address Book <a href="#" class="edit-link">EDIT</a></h2>
          <div class="address-container">
            <div class="address-box">
              <h3>DEFAULT SHIPPING ADDRESS</h3>
              <p><b>negative one degree kevin</b></p>
              <p>SENZ VILLES, LILITAN SUNGAI ARA, SUNGAI ARA, 11900 BAYAN LEPAS, PULAU PENANG 11-27-07</p>
              <p>Penang - Bayan Lepas - 11900</p>
              <p>(+60) 0143997403</p>
            </div>
            <div class="address-box">
              <h3>DEFAULT BILLING ADDRESS</h3>
              <p><b>negative one degree kevin</b></p>
              <p>SENZ VILLES, LILITAN SUNGAI ARA, SUNGAI ARA, 11900 BAYAN LEPAS, PULAU PENANG 11-27-07</p>
              <p>Penang - Bayan Lepas - 11900</p>
              <p>(+60) 0143997403</p>
            </div>
          </div>
        </div>
        

        <!-- customer recent Ordered -->
        <div class="card card-customer-orders">
            <h2>Recent Order</h2>
            <table>
                <thead>
                    <tr>
                        <th>Order Code</th>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Address</th>
                        <th>Status</th>
                        <th>Payment Method</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>ORD0001</td>
                        <td>iPhone Replica</td>
                        <td>1</td>
                        <td>$699</td>
                        <td>123 Main St, Springfield</td>
                        <td>Shipped</td>
                        <td>Credit Card</td>
                    </tr>
                    <!-- Add more rows if needed -->
                     <!-- Sample Ordered table placed by cutomer -->
                </tbody>
            </table>
        </div>

        


        <div class="card card-customer-orders">
            <!-- <h2>Your first order!</h2> -->
        </div>

        <div class="card card-customer-orders">
            <!-- <h2>Your first order!</h2> -->
        </div>
             
        <!-- 
        <div class="card card-customer-orders">
            <h2>Your first order!</h2>
            <div class="card card-10">
                <h2>Order Id #1001</h2>
              </div>
              <div class="card card-10">
                <h2>Calendar - 10</h2>
              </div>
              <div class="card car  d-10">
                <h2>Calendar - 10</h2>
              </div>
          </div>   
          -->   

        <!-- 
        <div class="card card-2">
          <h2>Orders - 2</h2>
        </div>
      
        <div class="card card-3">
          <h2>Shipped - 3</h2>
        </div>
      
        <div class="card card-4">
          <h2>Pending - 4</h2>
        </div>
      
        <div class="card card-5">
          <h2>Revenue - 5</h2>
        </div>
      
        <div class="card card-6">
          <h2>Users - 6</h2>
        </div>
      
        <div class="card card-7">
          <h2>Subscriptions - 7</h2>
        </div> -->
      
        <div class="card card-10">
          <!-- <h2>Calendar - 10</h2> -->
        </div>
      
        <div class="card card-11">
          <!-- <h2>User Activity - 11</h2> -->
        </div>
        
        <div class="card card-12">
          <!-- <h2>Sales Dynamics - 12</h2> -->
        </div>
      
        <div class="card card-13">
          <!-- <h2>Tasks - 13</h2> -->
        </div>
      </main>

      <footer class="dashboard-footer">
        <!-- Footer -->
        <div id="footer-container"></div>
      </footer>

</body>
</html>

<!-- sidebar-button-animation -->
<script>
const resizeBtn = document.getElementById("resize");
resizeBtn.addEventListener("click", function (e) {
e.preventDefault();
document.body.classList.toggle("sb-expand");
});
</script>


<script>
  fetch("../footer.html")
    .then(response => response.text())
    .then(data => {
      document.getElementById("footer-container").innerHTML = data;
    });
</script>


