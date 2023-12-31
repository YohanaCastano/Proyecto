/*DOMcontentLoaded, es una palabra reservada
o propiedad que espera que hayan unos elementos
creados del sitio web, que van a tener interaccion*/

/*propiedad addEventListener, debe suceder un evento*/

document.addEventListener("DOMContentLoaded", function () {
    
   
    const formulario = document.getElementById("formulario");
        const submitButton = document.getElementById("submitButton");
        const mensajeError = document.getElementById("mensajeError");
        
        const campos = [
            { id: 'nombre', regex: /[a-zA-Záéíóú\s]{3,15}/ },
            { id: 'apellido', regex: /^[a-zA-Záéíóú\s]{3,20}\D[a-zA-Z]{3,20}/ },
            { id: 'email', regex: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\.(com|es|co)$/ },
            { id: 'contraseña', regex: /^[a-zA-Záéíóú\s]{3,20}\D[a-zA-Z]{3,20}/ },
        ];
    
        campos.forEach(campo => {
            const input = document.getElementById(campo.id);
    
            input.addEventListener('keyup', () => validarCampo(campo.regex, input));
            input.addEventListener('blur', () => validarCampo(campo.regex, input));
            input.addEventListener('focus', () => validarCampo(campo.regex, input));
        });
    
        formulario.addEventListener('submit', function (event) {
            if (!validarFormulario(campos)) {
                event.preventDefault();
                mensajeError.textContent = "Por favor, completa todos los campos correctamente.";
            } else {
                mensajeError.textContent = ""; // Limpiar el mensaje de error si los datos son válidos
            }
        });
        
        function validarCampo(regex, input) {
            
           
    const isValid = regex.test(input.value);
            input.classList.toggle('formulario_grupo_incorrecto', !isValid);
            input.classList.toggle('formulario_grupo_correcto', isValid);
        }
    
        function validarFormulario(campos) {
            return campos.every(campo => {
                const input = document.getElementById(campo.id);
                validarCampo(campo.regex, input);
                return campo.regex.test(input.value);
            });
        }
    });