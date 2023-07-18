const materiaModel = require('../models/materia.model');

class MateriaService{
    MateriaService(){
    }
    async consultarMateria(dia){
        try{
            return await materiaModel.find({'dia':dia}).sort({inicio:1});
        }catch(error){
            return error;
        }
    }
    async guardarMateria(materia = new materiaModel()){
        try{
            var materiaGuardado;
            await materiaModel.create(materia).then((value) => {
                materiaGuardado = value;
            });
            return materiaGuardado;
        }catch(error){
            console.log(error);
        }
    }
    async eliminarMateria(idt){
        console.log(idt);
        var materiaEliminado;
        try{
            await materiaModel.findOneAndRemove(
                {
                    _id: idt
                }
            ).then((value) => {
                materiaEliminado = value;
            });
            return materiaEliminado;
        }catch(error){
            console.log(error);
        }
    }
    async modificarMateria(newMateria){
        var materiaModificado;
        try{
            await materiaModel.findOneAndUpdate({
                _id : newMateria._id
            },newMateria).then((value)=>{
                materiaModificado = value;
            })
            return materiaModificado;
        }catch(error){
            console.log(error);
        }
    }

}
module.exports = new MateriaService();