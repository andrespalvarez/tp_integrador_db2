import { MongoClient } from 'mongodb';

const url = "mongodb://andrespalvarez_db_user:lQmToGpnZi7f2Cgc@ac-ziztxd1-shard-00-00.4ranpsh.mongodb.net:27017,ac-ziztxd1-shard-00-01.4ranpsh.mongodb.net:27017,ac-ziztxd1-shard-00-02.4ranpsh.mongodb.net:27017/?ssl=true&replicaSet=atlas-335tcs-shard-0&authSource=admin&appName=Cluster0";
const client = new MongoClient(url);
const dbName = "mantenimiento_hogar"; // Nombre de la base de datos

async function main() {
	await client.connect();
	console.log('Conexión exitosa al servidor MongoDB');
	const db = client.db(dbName); // Con el mismo cliente podría acceder a múltiples bases de datos pasando otros valores a este método
	const collection = db.collection("clientes"); // Nombre de la colección

    // -------------------------------------------------------------------------
    // A. CREATE (Inserción)
    // -------------------------------------------------------------------------
    console.log("1. Ejecutando CREATE...");
    const nuevoCliente = {
      nombre: "Andres Alvarez",
      email: "andres.alvarez@example.com",
      telefono: "1212121212",
      direcciones: [
        { etiqueta: "Oficina", calle: "Neuquen 123", ciudad: "Plottier" }
      ],
      activo: true,
      fecha_alta: new Date()
    };
    const resultadoCreate = await collection.insertOne(nuevoCliente);
    const idGenerado = resultadoCreate.insertedId;
    console.log(`-> Cliente registrado con ID: ${idGenerado}\n`);

    // -------------------------------------------------------------------------
    // B. READ (Lectura respetando Baja Lógica)
    // -------------------------------------------------------------------------
    console.log("2. Ejecutando READ (Solo activos)...");
    const clientesActivos = await collection.find({ activo: true }).toArray();
    clientesActivos.forEach(c => {
      console.log(`   - [ID: ${c._id}] ${c.nombre} (${c.email})`);
    });
    console.log("\n");

    // -------------------------------------------------------------------------
    // C. UPDATE (Modificación de campos específicos)
    // -------------------------------------------------------------------------
    console.log(`3. Ejecutando UPDATE sobre el ID: ${idGenerado}...`);
    const resultadoUpdate = await collection.updateOne(
      { _id: idGenerado },
      { $set: { telefono: "1199998888" } }
    );
    console.log(`-> Documentos modificados: ${resultadoUpdate.modifiedCount}\n`);

    // -------------------------------------------------------------------------
    // D. DELETE (Baja Lógica)
    // -------------------------------------------------------------------------
    console.log(`4. Ejecutando DELETE (Baja Lógica) sobre el ID: ${idGenerado}...`);
    const resultadoDelete = await collection.updateOne(
      { _id: idGenerado },
      {
        $set: {
          activo: false,
          fecha_baja: new Date()
        }
      }
    );
    console.log(`-> Baja lógica aplicada. Documentos modificados: ${resultadoDelete.modifiedCount}\n`);
}

try {
	const result = await main();
	console.log(result);
} catch (error) {
	console.error('Error en la conexión con MongoDB:', error);
} finally {
	await client.close();
}