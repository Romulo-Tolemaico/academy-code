const {Router} = require('express');
const {consultarMateria,guardarMateria,eliminarMateria,modificarMateria} = require('../controllers/materia.controller');
const router = Router();

router.get('/api/materias/:dia',consultarMateria);
router.post('/api/materias/registro',guardarMateria);
router.delete('/api/materias/eliminar/:id',eliminarMateria);
router.put('/api/materias/modificar',modificarMateria);

module.exports = router;