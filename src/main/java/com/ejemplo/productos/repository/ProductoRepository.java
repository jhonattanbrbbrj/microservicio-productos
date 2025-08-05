package com.ejemplo.productos.repository;

import com.ejemplo.productos.model.Producto;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

// Acceso a la base de datos con métodos CRUD y búsqueda por nombre
public interface ProductoRepository extends JpaRepository<Producto, Long> {
    Optional<Producto> findByNombre(String nombre);
}
