<%@ page import="java.util.*, model.Customer" %>
<%
    List<Customer> customers = (List<Customer>) request.getAttribute("customers");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="layout/dashboard/dashboard_record.css">
    <link rel="stylesheet" href="layout/icon_n_search_bar.css">
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
        
        .container {
            width: 100%;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .header {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 20px;
            gap:10px;
        }
        .header input {
            padding: 10px;
            width: 200px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .header .search-bar {
    flex: 1; /* Push the search bar to the left */
    max-width: 300px; /* Optional: Limit the width of the search bar */
    margin-right: 20px; /* Add spacing between the search bar and buttons */
}
        .header button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-create {
            background-color: #008CBA;
            color: white;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #0065C4;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn {
            padding: 5px 10px;
            margin: 2px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-create {
    background-color: black; 
    color: white;
    font-size: 20px;
    font-weight: bold;
    width: 40px; 
    height: 40px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
    cursor: pointer;
    border: none; 
    transition: background-color 0.3s ease, transform 0.2s ease; 
}

.btn-create:hover {
    background-color: grey; 
    color:white;
    transform: scale(1.1); 
}

.btn-create:hover .plus-icon {
    animation: spin 1s ease-in-out; 
}

@keyframes spin {
    from {
        transform: rotate(0deg); 
    }
    to {
        transform: rotate(360deg); 
    }
}

.btn-refresh {
    background-color: #4CAF50; /* Green background */
    color: white; /* White text */
    font-size: 18px; /* Font size for the refresh icon */
    font-weight: bold;
    width: 40px; /* Circular button */
    height: 40px;
    border-radius: 50%; /* Make it a circle */
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Add a subtle shadow */
    cursor: pointer;
    border: none; /* Remove border */
    transition: background-color 0.3s ease, transform 0.2s ease; /* Smooth hover effect */
}

.btn-refresh:hover {
    background-color: #388E3C; /* Darker green on hover */
    transform: scale(1.1); /* Slightly enlarge on hover */
}
        .btn-view {
            background-color: #007BFF;
            color: white;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-view:hover {
    
    transform: scale(1.1); /* Slightly enlarge on hover */
}
        .btn-update {
            background-color: #4CAF50;
            color: white;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-update:hover {
    transform: scale(1.1); /* Slightly enlarge on hover */
        }

        .btn-delete {
            background-color: #f44336;
            color: white;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn-delete:hover {
    transform: scale(1.1); /* Slightly enlarge on hover */
        }
    </style>
</head>
<body>
    <header class="dashboard-header">
        <!-- <h1>00Aplus - Dashboard</h1> -->

        <div class="header-right">

          <input type="text" class="search-bar" placeholder="Search...">
          <div><img class="icon" src="img/profile.svg"  title="Profile" /></div>
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
            <li><a href="../user/customer_dashboard.jsp">customer dash</a></li>
            <li><a href="../user/staff_dashboard.jsp">staff dash</a></li>
          </ul>
        </nav>
        </div>

      </aside>
      
      
      <main class="dashboard-main">
        <h1>Customer Management</h1>
        
        <div class="container">
        <div class="header">
            <input type="text" class="search-bar" placeholder="Search...">
            
        </div>
        <!-- <h1>Record List</h1> -->
        <table>
    <thead>
        <tr>
            
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
    <% for (Customer c : customers) { %>
        <tr>
        
            <td><%= c.getId() %></td>
            <td><%= c.getUsername() %></td>
            <td><%= c.getEmail() %></td>
            <td><%= c.getPhoneNumber() %></td>
            <td>
                
                <form action="CustomerController" method="post" style="display:inline;">
                <input type="hidden" name="action" value="delete" />
                <input type="hidden" name="customer_Id" value="<%= c.getId() %>" />
                <button type="submit" class="btn btn-danger btn-sm"
                        onclick="return confirm('Are you sure you want to delete this customer?');">
                    Delete
                </button>
            </form>
            </td>
        </tr>
    <% } %>
    </tbody>
</table>
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
    fetch("../record_list.jsp")
        .then(response => response.text())
        .then(data => {
            document.getElementById("record_list").innerHTML = data;
            ProductInitializeCarousel();
        })
        .catch(error => console.error("Error loading record_list.html:", error));
</script>





