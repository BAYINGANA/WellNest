// backend/routes/moodRoutes.js
const express = require('express');
const router = express.Router();
const moodController = require('../controllers/moodController');

// CRUD for mood tracking
router.get('/', moodController.getAllMoods);
router.post('/', moodController.createMood);
router.get('/:id', moodController.getMoodById);
router.put('/:id', moodController.updateMood);
router.delete('/:id', moodController.deleteMood);

module.exports = router;
