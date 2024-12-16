const jsonServer = require("json-server");
const server = jsonServer.create();
const router = jsonServer.router("db.json");
const middlewares = jsonServer.defaults();

server.use(middlewares);

// Disable caching
server.use((req, res, next) => {
  res.header('Cache-Control', 'no-cache, no-store, must-revalidate');
  res.header('Pragma', 'no-cache');
  res.header('Expires', '0');
  next();
});

// Custom route for /api/explore with pagination and extra data
server.get("/api/explore", (req, res) => {
  // Get the raw data
  let data = router.db.get("data").value();
  const problemFilter = router.db.get("problem_filter").value();
  const metadata = router.db.get("metadata").value();

  // Parse pagination params
  const page = Math.max(1, parseInt(req.query._page) || 1);
  const limit = Math.max(1, parseInt(req.query._limit) || 10);
  
  // Calculate pagination
  const startIndex = (page - 1) * limit;
  const endIndex = startIndex + limit; // This will be used to slice the data
  
  // Get exactly 'limit' number of items
  const paginatedData = data.slice(startIndex, endIndex);

  // Response structure
  const response = {
    metadata: {
      ...metadata,
      total_pages: Math.ceil(data.length / limit) // Keep this stable based on the full data length
    },
    data: paginatedData,
    problem_filter: problemFilter
  };

  // Force status 200 and send response
  res.status(200).json(response);
});

// Use default router for other routes
server.use(router);

server.listen(3000, () => {
  console.log("JSON Server is running on http://localhost:3000");
});