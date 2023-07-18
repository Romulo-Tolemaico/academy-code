const express = require('express');
const morgan = require('morgan');
const cors = require('cors');

const appT = express();

appT.use(express.urlencoded({extended: true}));
appT.use(express.json());

appT.use(cors());

appT.use(morgan('dev'));
appT.use(require('./routers/tarea.route'));

console.log('tareas preparadas');

module.exports = {appT};
