const mongoose = require('mongoose');
const dbConection = async() => {
    try{
        console.log('Conectando DB......');
        await mongoose.connect('mongodb://localhost:27017/notedb',{
            useNewUrlParser: true,
        });
        console.log('Conectado...');
    }catch(error){
        throw Error(error);
    }
}


module.exports = {
    dbConection
}