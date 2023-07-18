const {Router} = require('express');
const {consultarTareas,guardarTarea,eliminarTarea,modificarTarea} = require('../controllers/tarea.controller');
const router = Router();

router.get('/api/tareas',consultarTareas);
router.post('/api/tareas/registro',guardarTarea);
router.delete('/api/tareas/eliminar/:id',eliminarTarea);
router.put('/api/tareas/modificar',modificarTarea);

module.exports = router;