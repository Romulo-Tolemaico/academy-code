const {Schema,model} = require('mongoose');
const tareaSchema = new Schema({
    titulo: String,
    detalle: String,
    estado: Boolean
});

module.exports = model('Tarea',tareaSchema);
