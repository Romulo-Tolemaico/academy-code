const express = require('express');
const morgan = require('morgan');
const cors = require('cors');

const appM = express();

appM.use(express.urlencoded({extended: true}));
appM.use(express.json());

appM.use(cors());

appM.use(morgan('dev'));
appM.use(require('./routers/materia.route'));

console.log('materias preparadas');

module.exports = {appM};
