<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Product</title>
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

        .form-group input, .form-group textarea, .form-group select {
            flex: 2;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-group textarea {
            resize: none;
        }

        .form-divider {
            border-top: 1px solid #ddd;
            margin: 20px 0;
        }

        .image-preview {
            width: 100%;
            height: 200px;
            background-color: #e0e0e0;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 1px dashed #ccc;
            margin-bottom: 15px;
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
        <h2>Create Product</h2>
        <form>
            <!-- Product Name and Category -->
            <div class="form-group">
                <label for="product-name">Product Name:</label>
                <input type="text" id="product-name" name="product-name" placeholder="Enter product name">
            </div>
            <div class="form-group">
                <label for="product-category">Category:</label>
                <select id="product-category" name="product-category">
                    <option value="">Select category</option>
                    <option value="electronics">Electronics</option>
                    <option value="fashion">Fashion</option>
                    <option value="home">Home</option>
                </select>
            </div>

            <!-- Price and Stock -->
            <div class="form-group">
                <label for="product-price">Price:</label>
                <input type="number" id="product-price" name="product-price" placeholder="Enter price">
            </div>
            <div class="form-group">
                <label for="product-stock">Stock:</label>
                <input type="number" id="product-stock" name="product-stock" placeholder="Enter stock quantity">
            </div>

            <div class="form-divider"></div>

            <!-- Image Upload -->
            <div class="image-preview">
                <span>Image Preview</span>
            </div>
            <div class="form-group">
                <label for="product-image">Upload Image:</label>
                <input type="file" id="product-image" name="product-image" accept="image/*">
            </div>

            <div class="form-divider"></div>

            <!-- Description -->
            <div class="form-group">
                <label for="product-description">Description:</label>
                <textarea id="product-description" name="product-description" rows="4" placeholder="Enter product description"></textarea>
            </div>

            <!-- Actions -->
            <div class="form-actions">
                <button type="submit" class="btn-submit">Create</button>
                <button type="reset" class="btn-reset">Reset</button>
            </div>
        </form>
    </div>
</body>
</html>