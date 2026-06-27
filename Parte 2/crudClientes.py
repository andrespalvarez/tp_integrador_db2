# ==========================================
# CELDA: OPERACIONES CRUD (BLOQUE 1)
# ==========================================
from pymongo import MongoClient
from bson import ObjectId
import datetime

# 1. CONEXIÓN (DRIVER NATIVO)
MONGO_URI = "mongodb+srv://tester01:miclave123@bbdd2tpi.u9g34v6.mongodb.net/"
client = MongoClient(MONGO_URI)
db = client["mantenimiento_hogar"]
clientes_col = db["clientes"]

print("--- INICIANDO PRUEBAS CRUD sobre clientes  ---\n")

# -------------------------------------------------------------------------
# A. CREATE (Inserción)
# -------------------------------------------------------------------------
print("1. Ejecutando CREATE...")
nuevo_cliente = {
    "nombre": "Juan Pérez",
    "email": "juan.perez@example.com",
    "telefono": "1122334455",
    "direcciones": [
        { "etiqueta": "Casa", "calle": "Av. Siempreviva 742", "ciudad": "CABA" }
    ],
    "activo": True,
    "fecha_alta": datetime.datetime.now()
}
resultado_create = clientes_col.insert_one(nuevo_cliente)
id_generado = resultado_create.inserted_id
print(f"-> Cliente registrado con ID: {id_generado}\n")


# -------------------------------------------------------------------------
# B. READ (Lectura respetando Baja Lógica)
# -------------------------------------------------------------------------
print("2. Ejecutando READ (Solo activos)...")
# El requisito pide explícitamente no listar datos marcados como eliminados (activo: true)
clientes_activos = clientes_col.find({"activo": True})

for c in clientes_activos:
    print(f"   - [ID: {c['_id']}] {c['nombre']} ({c['email']})")
print("\n")


# -------------------------------------------------------------------------
# C. UPDATE (Modificación de campos específicos)
# -------------------------------------------------------------------------
print(f"3. Ejecutando UPDATE sobre el ID: {id_generado}...")
# Modificamos el teléfono del cliente que acabamos de crear
resultado_update = clientes_col.update_one(
    {"_id": id_generado},
    {"$set": {"telefono": "1199998888"}}
)
print(f"-> Documentos modificados: {resultado_update.modified_count}\n")


# -------------------------------------------------------------------------
# D. DELETE (Baja Lógica)
# -------------------------------------------------------------------------
print(f"4. Ejecutando DELETE (Baja Lógica) sobre el ID: {id_generado}...")
# No borramos físicamente del disco; cambiamos 'activo' a False y agregamos 'fecha_baja'
resultado_delete = clientes_col.update_one(
    {"_id": id_generado},
    {
        "$set": {
            "activo": False,
            "fecha_baja": datetime.datetime.now()
        }
    }
)
print(f"-> Baja lógica aplicada. Documentos modificados: {resultado_delete.modified_count}\n")


# Verificación final del READ para demostrar que ya no aparece el cliente "eliminado"
print("5. Verificación final READ (El cliente borrado ya no debería listar):")
for c in clientes_col.find({"activo": True}):
    if c['_id'] == id_generado:
        print("    ERROR: El cliente sigue apareciendo.")
        break
else:
    print("   ÉXITO: El cliente con baja lógica fue omitido correctamente.")
