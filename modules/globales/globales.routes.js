const express = require("express");
const router = express.Router();
const db = require("../../config/db");

// Listar periodos académicos
router.get("/periodos", (req, res) => {
  const query = `
    SELECT
      id AS id_periodo,
      CONCAT(anio, ' - ', periodo) AS nombre_periodo
    FROM periodos_academicos
    ORDER BY anio DESC, periodo DESC`;

  db.query(query, (err, results) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Error en el servidor", error: err });
    }

    res.json(results);
  });
});

// Listar áreas
router.get("/areas", (req, res) => {
  const query = `
    SELECT
      id AS id_area,
      nombre_asignatura AS nombre_area
    FROM asignaturas
    WHERE id IN (1, 2, 3, 4)
    ORDER BY id ASC`;

  db.query(query, (err, results) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Error en el servidor", error: err });
    }

    res.json(results);
  });
});

// Consultar estudiante por código
router.get("/estudiante/:codigo", (req, res) => {
  const { codigo } = req.params;

  const query = `
    SELECT
      est.id AS id_estudiante,
      est.codigo AS codigo_estudiante,
      CONCAT_WS(' ', per.primer_nombre, per.segundo_nombre, per.primer_apellido, per.segundo_apellido) AS nombre_estudiante,
      per.id AS id_persona,
      per.numero_identificacion,
      per.datos_adicionales->>'$.celular' AS celular,
      per.datos_adicionales->>'$.correo' AS correo,
      te.nombre AS estado_estudiante
    FROM estudiantes AS est
    INNER JOIN personas AS per ON est.id_persona = per.id
    INNER JOIN estados_estudiantes AS te ON est.id_estado_estudiante = te.id
    WHERE est.codigo = ?`;

  db.query(query, [codigo], (err, results) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Error en el servidor", error: err });
    }

    if (results.length === 0) {
      return res.status(404).json({ message: "Estudiante no encontrado" });
    }

    res.json(results[0]);
  });
});

module.exports = router;