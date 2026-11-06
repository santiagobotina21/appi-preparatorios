const mysql = require("mysql2");
// Configuración de los datos de conexión
const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Santy2188", // Reemplaza por tu contraseña de MySQL
  database: "preparatorios",
});

db.connect((err) => {
  if (err) {
    console.error("❌ Error al conectar a la base de datos:", err.message);
    return;
  }
  console.log("✅ Conexión exitosa a la base de datos MySQL");
});



module.exports = db;