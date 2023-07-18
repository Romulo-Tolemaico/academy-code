const {appT} = require('./appT');
const {appM} = require('./appM');
const {dbConection} = require('./database');

async function main(){
    await dbConection();
    await appM.listen(4000);
    await appT.listen(4002);
}

main();