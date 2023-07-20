const tareaModel = require('../models/tarea.model');

class TareaService{
    TareaService(){}
    async consultarTareas(){
        try{
            return await tareaModel.find().sort({estado:1});
        }catch(error){
            return error;
        }
    }

    async guardarTarea(tarea = new tareaModel()){
        try{
            var tareaGuardado;
            await tareaModel.create(tarea).then((value) => {
                tareaGuardado = value;
            });
            return tareaGuardado;
        }catch(error){
            console.log(error);
        }
    }

    async eliminarTarea(idt){
        console.log(idt);
        var tareaEliminado;
        try{
            await tareaModel.findOneAndRemove(
                {
                    _id: idt
                }
            ).then((value) => {
                tareaEliminado = value;
            });
            return tareaEliminado;
        }catch(error){
            console.log(error);
        }
    }

    async modificarTarea(newTarea){
        var tareaModificado;
        try{
            await tareaModel.findOneAndUpdate({
                _id : newTarea._id
            },newTarea).then((value)=>{
                tareaModificado = value;
            })
            return tareaModificado;
        }catch(error){
            console.log(error);
        }
    }
}

module.exports = new TareaService();

