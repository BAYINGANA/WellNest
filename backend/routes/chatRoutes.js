// backend/routes/chatRoutes.js
const express = require('express');
const router = express.Router();
const chatController = require('../controllers/chatController');

// Endpoints for chat functionality
router.get('/', chatController.getAllChats);
router.post('/', chatController.createChat);
router.get('/:id', chatController.getChatById);
router.delete('/:id', chatController.deleteChat);

module.exports = router;
