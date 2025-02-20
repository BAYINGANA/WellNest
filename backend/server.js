// backend/server.js
const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');

dotenv.config();
const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

// Import routes
const moodRoutes = require('./routes/moodRoutes');
const journalRoutes = require('./routes/journalRoutes');
const chatRoutes = require('./routes/chatRoutes');

app.use('/api/moods', moodRoutes);
app.use('/api/journals', journalRoutes);
app.use('/api/chats', chatRoutes);

app.get('/', (req, res) => {
  res.send('Welcome to WellNest Backend');
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
