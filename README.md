# Evolving

A demo iOS app
![App Banner](https://github.com/user-attachments/assets/860a9e20-ec6d-4a72-847b-e84586bf10d5)

## For the iOS App

### Requirements
- macOS Ventura 13.0 or later
- Xcode 15.0 or later
- iOS 17.0 or later
- Swift 5.9 or later

### Installation
1. Clone the repository:
```bash
git clone [repository-url]
cd Evolving
```

2. Open the project in Xcode:
```bash
open Evolving.xcodeproj
```

### Building and Running
1. Select your target device/simulator in Xcode
2. Press `Cmd + R` or click the Play button to build and run the project

### Project Structure
The iOS project follows MVVM architecture, powered by 3 Swift Packages:
- Networking - Handles networking operations, model, response and services
- DesignComponents - Reusable UI components and Design System
- Utils - Utility classes and extensions

### Development
The iOS project uses Swift Package Manager for dependency management. All dependencies are automatically resolved when opening the project in Xcode.

### Troubleshooting
If you encounter any build issues:
1. Clean the build folder (Shift + Cmd + K)
2. Clean the build cache (Option + Shift + Cmd + K)
3. Re-run the project

## For the Mock Server (Backend)

### Requirements
- Node.js 14.0 or later

### Installation
1. Navigate to the mock server directory:
```bash
cd mock-server
```

2. Install dependencies:
```bash
npm install
```

### Running the Server
1. Start the server:
```bash
npm start
```
The mock server will start running on `http://localhost:3000`

### API Endpoints

#### Explore Feed
```
GET /api/explore
```

Query Parameters:
- `_page`: Page number (default: 1)
- `_limit`: Items per page (default: 10)

Response Format:
```json
{
  "metadata": {
    "total_pages": number,
    ...other metadata
  },
  "data": [
    {
      // Feed items
    }
  ],
  "problem_filter": [
    // Filter options
  ]
}
```

### Project Structure
- `db.json`: Mock data for the API
- `routes.json`: API route configurations
- `server.js`: Server configuration for a custom routing

### Development
The mock server uses `json-server` to provide a RESTful API with mock data.

### Troubleshooting
If you encounter any server issues:
1. Ensure Node.js is installed correctly
2. Check if the server is running on port 3000
3. Try stopping and restarting the server
4. Verify the contents of db.json and routes.json

## Running the Complete Application
1. Start the mock server first (follow the Mock Server instructions)
2. Run the iOS application (follow the iOS Application instructions)
3. The iOS app will communicate with the mock server running on localhost

## Key Takeaways
- Using Swift Package Manager making it a practice
- Learning about Node.js and json-server for the mock server (obviously with the help of LLMs)

### Video Demo
https://github.com/user-attachments/assets/3a045a72-1d62-4d55-a4a7-b0397e5ad1d3

