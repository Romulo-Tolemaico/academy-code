const tareaService =require('../services/tarea.service');

const consultarTareas = async(req,res) => {
    res.json({
        tareas: await tareaService.consultarTareas()
    });
}

const guardarTarea = async(req,res) => {
    console.log(req.body);
    res.json({
        tarea: await tareaService.guardarTarea(req.body)
    });
}

const eliminarTarea = async(req,res) =>{
    res.json({
        tarea: await tareaService.eliminarTarea(req.params.id)
    })
}

const modificarTarea = async(req,res) => {
    res.json({
        tarea: await tareaService.modificarTarea(req.body)
    });
}

module.exports = {consultarTareas,guardarTarea,eliminarTarea,modificarTarea};