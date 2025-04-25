<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../layout/dashboard/dashboard.css">
    <link rel="stylesheet" href="../../layout/icon_n_search_bar.css">
    <title>staff dashboard</title>
</head>
<body>
    <header class="dashboard-header">
        <div class="header-right">
          <input type="text" class="search-bar" placeholder="Search...">
          <div><img class="icon" src="../../img/profile.svg"  title="Profile" /></div>
          <!-- <div><img class="icon" src="../../img/shopping-bag.svg" title="Your Items"/></div> -->
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
            <li><h1><a href="#">Dashboard</a></h1></li><hr style="color: aliceblue;">
            <li><a href="#">Products</a></li>
            <li><a href="#">Settings</a></li><hr style="color: aliceblue;">
            <li><a href="admin_dashboard.jsp">admin dash</a></li>
            <li><a href="customer_dashboard.jsp">customer dash</a></li>
            
          </ul>
        </nav>
        </div>

      </aside>
      
      
      <main class="dashboard-main">
        <h1>Dashboard</h1>
        <div class="card card-1">
          <h2>Data Item</h2>
          <hr style="color: #2f6bd4 ;">
        </div>

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
      
        <div class="card card-8">
          <h2>Analytics - 8</h2>
          <!-- <div class="scrollable-div" id="container"></div> -->
        </div>
      
       <div class="card card-9">
          <h2>Inbox - 9</h2>
        </div>

        <div class="card card-9">
          <h2>Inbox - 9</h2>
        </div>

        <div class="card card-9">
          <h2>Inbox - 9</h2>
        </div>
      
        <div class="card card-10">
          <h2>Calendar - 10</h2>
        </div>
      
        <div class="card card-11">
          <h2>User Activity - 11</h2>
        </div>
      
        <div class="card card-12">
          <h2>Sales Dynamics - 12</h2>
        </div>
      
        <div class="card card-13">
          <h2>Tasks - 13</h2>
        </div>
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
  const container = document.getElementById("container");
        const repeatTimes = 20; // You can change this number to make it flexible

        for (let i = 0; i < repeatTimes; i++) {
            const p = document.createElement("p");
            p.textContent = "Hello World";
            container.appendChild(p);
        }
</script>


