const express = require("express");
const cors = require("cors");

// Importación de módulos/rutas
const preparatoriosRoutes = require("./modules/preparatorios/preparatorios.routes");
const globalesRoutes = require("./modules/globales/globales.routes");


const app = express();

// Middlewares
app.use(cors());
app.use(express.json());

// Declaración de Endpoints por Módulo
app.use("/api/preparatorios", preparatoriosRoutes);
app.use("/api/globales", globalesRoutes);


// Ruta principal de prueba
app.get("/", (req, res) => {
  res.send("API Servidor Modular funcionando correctamente");
});

// Iniciar Servidor
const PORT = 4000;
app.listen(PORT, () => {
  console.log(`🚀 Servidor ejecutándose en http://localhost:${PORT}`);
});