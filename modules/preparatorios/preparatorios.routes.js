const express = require("express");
const router = express.Router();
const db = require("../../config/db");

// Listar preparatorios (y buscar por título con ?titulo=)
router.get("/", (req, res) => {
  const { titulo } = req.query;

  let query = "SELECT * FROM preparatorios ORDER BY id";
  let params = [];

  if (titulo) {
    query = "SELECT * FROM preparatorios WHERE titulo LIKE ? ORDER BY id";
    params = [`%${titulo}%`];
  }

  db.query(query, params, (err, results) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Error en el servidor", error: err });
    }

    res.json(results);
  });
});

// Consultar un preparatorio por ID
router.get("/:id", (req, res) => {
  const { id } = req.params;

  db.query("SELECT * FROM preparatorios WHERE id = ?", [id], (err, results) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Error en el servidor", error: err });
    }

    if (results.length === 0) {
      return res.status(404).json({ message: "Preparatorio no encontrado" });
    }

    res.json(results[0]);
  });
});

// Crear preparatorio
router.post("/", (req, res) => {
  const {
    titulo,
    acuerdo,
    fecha_evaluacion,
    lugar_evaluacion,
    limite_inscritos,
    id_tipo_evaluacion,
    valor_pago,
    valor_pagado,
    fecha_limite_pago,
    mostrar_recibo,
    estado,
  } = req.body;

  if (!titulo || !fecha_evaluacion || !lugar_evaluacion || !limite_inscritos) {
    return res.status(400).json({ message: "Faltan datos obligatorios" });
  }

  // Verificar que exista un periodo académico activo
  const queryPeriodo =
    "SELECT id FROM periodos_academicos WHERE actual = TRUE LIMIT 1";

  db.query(queryPeriodo, (err, periodos) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Error en el servidor", error: err });
    }

    if (periodos.length === 0) {
      return res
        .status(400)
        .json({ message: "No hay un periodo académico activo" });
    }

    const queryInsert = `INSERT INTO preparatorios
      (titulo, acuerdo, fecha_evaluacion, lugar_evaluacion, limite_inscritos,
       id_tipo_evaluacion, valor_pago, valor_pagado, fecha_limite_pago,
       mostrar_recibo, estado)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;

    const valores = [
      titulo,
      acuerdo,
      fecha_evaluacion,
      lugar_evaluacion,
      limite_inscritos,
      id_tipo_evaluacion,
      valor_pago,
      valor_pagado,
      fecha_limite_pago,
      mostrar_recibo ?? false,
      estado ?? true,
    ];

    db.query(queryInsert, valores, (err, result) => {
      if (err) {
        return res
          .status(500)
          .json({ message: "Error al registrar el preparatorio", error: err });
      }

      res.status(201).json({
        message: "Preparatorio registrado correctamente",
        id: result.insertId,
      });
    });
  });
});

// Actualizar preparatorio
router.put("/:id", (req, res) => {
  const { id } = req.params;
  const {
    titulo,
    acuerdo,
    fecha_evaluacion,
    lugar_evaluacion,
    limite_inscritos,
    id_tipo_evaluacion,
    valor_pago,
    valor_pagado,
    fecha_limite_pago,
    mostrar_recibo,
    estado,
  } = req.body;

  if (!titulo || !fecha_evaluacion || !lugar_evaluacion || !limite_inscritos) {
    return res.status(400).json({ message: "Faltan datos obligatorios" });
  }

  const queryUpdate = `UPDATE preparatorios SET
      titulo = ?, acuerdo = ?, fecha_evaluacion = ?, lugar_evaluacion = ?,
      limite_inscritos = ?, id_tipo_evaluacion = ?, valor_pago = ?,
      valor_pagado = ?, fecha_limite_pago = ?, mostrar_recibo = ?, estado = ?
    WHERE id = ?`;

  const valores = [
    titulo,
    acuerdo,
    fecha_evaluacion,
    lugar_evaluacion,
    limite_inscritos,
    id_tipo_evaluacion,
    valor_pago,
    valor_pagado,
    fecha_limite_pago,
    mostrar_recibo ?? false,
    estado ?? true,
    id,
  ];

  db.query(queryUpdate, valores, (err, result) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Error al actualizar el preparatorio", error: err });
    }

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Preparatorio no encontrado" });
    }

    res.json({ message: "Preparatorio actualizado correctamente" });
  });
});

// Eliminar preparatorio
router.delete("/:id", (req, res) => {
  const { id } = req.params;

  db.query("DELETE FROM preparatorios WHERE id = ?", [id], (err, result) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Error al eliminar el preparatorio", error: err });
    }

    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Preparatorio no encontrado" });
    }

    res.json({ message: "Preparatorio eliminado correctamente" });
  });
});

module.exports = router;