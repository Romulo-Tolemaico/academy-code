const {Schema,model} = require('mongoose');
const materiaSchema = new Schema({
    dia: String,
    nombre: String,
    inicio: String,
    final: String
});

module.exports = model('Materia',materiaSchema);

