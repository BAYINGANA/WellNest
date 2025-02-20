// backend/controllers/moodController.js
const pool = require('../config/db');

exports.getAllMoods = async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM moods ORDER BY created_at DESC');
    res.json(result.rows);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Server Error');
  }
};

exports.createMood = async (req, res) => {
  try {
    const { mood, note } = req.body;
    const result = await pool.query(
      'INSERT INTO moods (mood, note) VALUES ($1, $2) RETURNING *',
      [mood, note]
    );
    res.json(result.rows[0]);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Server Error');
  }
};

exports.getMoodById = async (req, res) => {
  try {
    const { id } = req.params;
    const result = await pool.query('SELECT * FROM moods WHERE id = $1', [id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ msg: 'Mood not found' });
    }
    res.json(result.rows[0]);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Server Error');
  }
};

exports.updateMood = async (req, res) => {
  try {
    const { id } = req.params;
    const { mood, note } = req.body;
    const result = await pool.query(
      'UPDATE moods SET mood = $1, note = $2 WHERE id = $3 RETURNING *',
      [mood, note, id]
    );
    if (result.rows.length === 0) {
      return res.status(404).json({ msg: 'Mood not found' });
    }
    res.json(result.rows[0]);
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Server Error');
  }
};

exports.deleteMood = async (req, res) => {
  try {
    const { id } = req.params;
    const result = await pool.query('DELETE FROM moods WHERE id = $1 RETURNING *', [id]);
    if (result.rows.length === 0) {
      return res.status(404).json({ msg: 'Mood not found' });
    }
    res.json({ msg: 'Mood deleted successfully' });
  } catch (error) {
    console.error(error.message);
    res.status(500).send('Server Error');
  }
};
