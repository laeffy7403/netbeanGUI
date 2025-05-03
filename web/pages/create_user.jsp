<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 0;
            background-color: #f9f9f9;
        }

        .form-container {
            max-width: 1200px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .form-group label {
            flex: 1;
            margin-right: 10px;
            font-weight: bold;
        }

        .form-group input, .form-group select {
            flex: 2;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-divider {
            border-top: 1px solid #ddd;
            margin: 20px 0;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end; /* Align buttons to the right */
            gap: 10px; /* Add spacing between buttons */
        }

        .form-actions button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-submit {
            /* background-color: #4CAF50; */
            /* color: white; */
        }

        .btn-reset {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Create User</h2>
        <form>
            <!-- Username -->
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter username" required>
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter password" required>
            </div>

            <!-- Email -->
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter email" required>
            </div>

            <!-- Phone Number -->
            <div class="form-group">
                <label for="phone-number">Phone Number:</label>
                <input type="text" id="phone-number" name="phone-number" placeholder="Enter phone number">
            </div>

            <div class="form-divider"></div>

            <!-- Actions -->
            <div class="form-actions">
                <button type="submit" class="btn-submit">Create</button>
                <button type="reset" class="btn-reset">Reset</button>
            </div>
        </form>
    </div>
</body>
</html>