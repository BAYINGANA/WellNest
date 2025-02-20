// backend/controllers/chatController.js
const pool = require('../config/db');

exports.getAllChats = async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM chats ORDER BY created_at DESC');
    res.json(result.rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Server Error');
  }
};

exports.createChat = async (req, res) => {
  try {
    const { username, message } = req.body;
    const result = await pool.query(
      'INSERT INTO chats (username, message) VALUES ($1, $2) RETURNING *',
      [username, message]
    );
    res.json(result.rows[0]);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Server Error');
  }
};

exports.getChatById = async (req, res) => {
  try {
    const { id } = req.params;
    const result = await pool.query('SELECT * FROM chats WHERE id = $1', [id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ msg: 'Chat not found' });
    }
    res.json(result.rows[0]);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Server Error');
  }
};

exports.deleteChat = async (req, res) => {
  try {
    const { id } = req.params;
    const result = await pool.query('DELETE FROM chats WHERE id = $1 RETURNING *', [id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ msg: 'Chat not found' });
    }
    res.json({ msg: 'Chat deleted successfully' });
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Server Error');
  }
};
