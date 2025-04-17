<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Record List</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }
        .container {
            width: 80%;
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
            background-color: #f2f2f2;
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
    <div class="container">
        <div class="header">
            <input type="text" class="search-bar" placeholder="Search...">
            <button class="btn btn-refresh">
        <span class="refresh-icon">⟳</span>
    </button>
            <button class="btn btn-create">
                <span class="plus-icon">+</span>
            </button>
        </div>
        <h1>Record List</h1>
        <table>
            <thead>
                <tr>
                    <th></th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox"/></td>
                    <td>1</td>
                    <td>John Doe</td>
                    <td>john.doe@example.com</td>
                    <td>(123) 456-7890</td>
                    <td>
                        <button class="btn btn-view">View</button>
                        <button class="btn btn-update">Update</button>
                        <button class="btn btn-delete">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td><input type="checkbox"/></td>
                    <td>2</td>
                    <td>Jane Smith</td>
                    <td>jane.smith@example.com</td>
                    <td>(098) 765-4321</td>
                    <td>
                        <button class="btn btn-view">View</button>
                        <button class="btn btn-update">Update</button>
                        <button class="btn btn-delete">Delete</button>
                    </td>
                </tr>
                <!-- Add more rows as needed -->
            </tbody>
        </table>
    </div>
</body>
</html>