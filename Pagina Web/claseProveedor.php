<?php
class Proveedor {
    private $Nombre;
    private $Apellido;
    private $Documento;
    private $Email;
    private $NombreEmpresa;

    public function __construct(string $Nombre, string $Apellido, int $Documento, string $Email, string $NombreEmpresa) {
        $this->Nombre = $Nombre;
        $this->Apellido = $Apellido;
        $this->Documento = $Documento;
        $this->Email = $Email;
        $this->NombreEmpresa = $NombreEmpresa;
    }
  
    //getter y setters
    //nombre
    public function getNombre() {
        return $this->Nombre;
    }

    public function setNombre($Nombre) {
        $this->Nombre = $Nombre;
        return $this;
    }

    //apellido
    public function getApellido() {
        return $this->Apellido;
    }

    public function setApellido($Apellido) {
        $this->Apellido = $Apellido;
        return $this;
    }
 
    //documento
    public function getDocumento() {
        return $this->Documento;
    }

    public function setDocumento($Documento) {
        $this->Documento = $Documento;
        return $this;
    }

    //Email
    public function getEmail() {
        return $this->Email;
    }

    public function setEmail($Email) {
        $this->Email = $Email;
        return $this;
    }
    //Nombre Empresa

    public function getNombreEmpresa() {
        return $this->NombreEmpresa;
    }

    public function setNombreEmpresa($NombreEmpresa) {
        $this->NombreEmpresa = $NombreEmpresa;
        return $this;
    }
}
?>
