<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../layout/dashboard/dashboard_record.css">
    <link rel="stylesheet" href="../../layout/icon_n_search_bar.css">
    <title>product record list</title>


    <style>
        * {
        box-sizing: border-box;
    }
        #record_list {
            width:auto;
            padding: 20px;
            box-sizing: border-box;
        }
    
        .record-list-container {
            width: 100%;
            max-width: 1200px; /* Optional: Set a max width */
            margin: 0 auto; /* Center the content */
        }
    </style>
</head>
<body>
    <header class="dashboard-header">
        <!-- <h1>00Aplus - Dashboard</h1> -->

        <div class="header-right">

          <input type="text" class="search-bar" placeholder="Search...">
          <div><img class="icon" src="../../img/profile.svg"  title="Profile" /></div>
      </div>
      </header>
      
      <aside class="dashboard-sidebar">
        <!-- <div class="logo">&#9812;</div> -->
        <button type="button" id="resize">
          &#9776;
        </button>

        <div>
        <nav class="dashboard-nav">
          <ul>
            <li><h1><a href="#">Dashboard</a></h1></li><hr style="color: aliceblue;"><br>
            <li><a href="#">Orders</a></li>
            <li><a href="#">Products</a></li>
            <li><a href="#">Customers</a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Staff</a></li>
            <li><a href="#">Settings</a></li><br><hr style="color: aliceblue;">
            <li><a href="customer_dashboard.html">customer dash</a></li>
            <li><a href="staff_dashboard.html">staff dash</a></li>
          </ul>
        </nav>
        </div>

      </aside>
      
      
      <main class="dashboard-main">
        <h1>Product Management</h1>
        <div id="record_list"></div>
        

      </main>
      
      <footer class="dashboard-footer">
        <code><p>&copy; 2023 00Aplus. All rights reserved.</p>
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
    fetch("../record_list.jsp")
        .then(response => response.text())
        .then(data => {
            document.getElementById("record_list").innerHTML = data;
            ProductInitializeCarousel();
        })
        .catch(error => console.error("Error loading record_list.html:", error));
</script>



