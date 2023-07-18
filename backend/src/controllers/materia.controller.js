const materiaService =require('../services/materia.service');

const consultarMateria = async(req,res) => {
    res.json({
        materias: await materiaService.consultarMateria(req.params.dia)
    });
}

const guardarMateria = async(req,res) => {
    console.log(req.body);
    res.json({
        materia: await materiaService.guardarMateria(req.body)
    });
}

const eliminarMateria = async(req,res) =>{
    res.json({
        materia: await materiaService.eliminarMateria(req.params.id)
    })
}

const modificarMateria = async(req,res) => {
    res.json({
        materia: await materiaService.modificarMateria(req.body)
    });
}

module.exports = {consultarMateria,guardarMateria,eliminarMateria,modificarMateria};