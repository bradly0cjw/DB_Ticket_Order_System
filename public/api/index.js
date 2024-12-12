const express = require('express');
const app = express();
const port = 3000;

// Middleware to parse JSON bodies
app.use(express.json());

// Basic route
app.get('/', (req, res) => {
  // res.send('Hello World!');
  // redirect to ticket.cypone.dev
  res.redirect('https://ticket.cypone.dev');
});

// Example route to get user data
app.get('/users', (req, res) => {
  const users = [
    { id: 1, name: 'John Doe' },
    { id: 2, name: 'Jane Doe' }
  ];
  res.json(users);
});

// Example route to create a new user
app.post('/users', (req, res) => {
  const newUser = req.body;
  newUser.id = Date.now(); // Simple ID generation
  res.status(201).json(newUser);
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});

// Simple ping request
app.get('/ping', (req, res) => {
  res.send('pong');
});