<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">

    <!-- Fuentes -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- Iconos -->
    <script src="https://kit.fontawesome.com/bfdec4dace.js" crossorigin="anonymous"></script>

    <!-- Estilos -->
    <!-- <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/sobrenos_styles.css"> -->
    <link rel="stylesheet" href="css/logi.css">

    <!-- transiciones -->
    <link rel="stylesheet" href="https://unpkg.com/transition-style">

    <!-- Animate -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

    <title>Registro/Longin</title>
</head>

<body>
    <!-- registro dinamico -->
    <div class="regs">
        <div class="prove_butt">
            <button id="btn-registro" onclick="showFormreg()">Registro</button>
            <button id="btn-login" onclick="showFormlog()">Login</button>
        </div>
        <div class="regist" id="regist" style="display: block;" transition-style="in:wipe:down">
            <!-- onsubmit="return validarFormulario()" -->
            <h1>Registro</h1>
            <form action="registro.php" method="POST" id="registrationForm">
                <input type="text" name="nombre" placeholder="Nombre" required>
                <input type="text" name="direccion" placeholder="Dirección" required>
                <input type="tel" name="telefono" placeholder="Teléfono" pattern="\(\d{3}\) \d{3}[-\s]\d{4}" title="Un número de teléfono válido consta de un código de 3 cifras entre paréntesis, un espacio, las tres primeras cifras del número, un espacio o guión (-) y cuatro cifras más" required>
                <input type="text" name="email" placeholder="Email" required>
                <input type="text" name="usuario" placeholder="Usuario" required>
                <input type="password" name="password" id="password" placeholder="Contraseña" onblur="validarContrasenas()" required>
                <input type="password" name="password2" id="password2" placeholder="Confirmar Contraseña" oninput="validarContrasenas()" required>
                <span id="mensaje-contrasenas"></span>
                <select name="pregunta">
                    <?php
                    include 'adminzone/includes/db.php';
                    $query = "SELECT * FROM Preguntas";
                    $resultado = $conn->query($query);
                    while ($row = $resultado->fetch_assoc()) {
                        echo "<option value='" . $row['PreguntaID'] . "'>" . $row['Pregunta'] . "</option>";
                    }
                    $conn->close();
                    ?>
                </select>
                <input type="text" name="respuesta" placeholder="Respuesta" required>
                <input type="submit" value="Registrar" onclick="registerUser(event)">
            </form>
        </div>
        <div class="login" id="login" style="display: none;" transition-style="in:wipe:up">
            <h1>Login</h1>
            <form action="loginu.php" method="POST" id="loginFrom">
                <input type="text" name="usuario" placeholder="Usuario" required>
                <input type="password" name="passwordl" placeholder="Contraseña" required>
                <input type="submit" value="Ingresar" onclick="loginUser(event)">
            </form>
        </div>
    </div>
    <script>
        var btnRegistro = document.getElementById("btn-registro");
        var btnLogin = document.getElementById("btn-login");
        var registro = document.getElementById("regist");
        var login = document.getElementById("login");

        var loginAttempts = 0;

        function showFormreg() {
            registro.style.display = "block";
            login.style.display = "none";
        }

        function showFormlog() {
            login.style.display = "block";
            registro.style.display = "none";
        }

        function validarContrasenas() {
            var password = document.getElementById("password").value;
            var password2 = document.getElementById("password2").value;
            var mensaje = document.getElementById("mensaje-contrasenas");

            if (password !== password2) {
                mensaje.innerHTML = "Las contraseñas no coinciden.";
                mensaje.style.color = "red";
            } else {
                mensaje.innerHTML = "";
            }
        }

        function registerUser(event) {
            event.preventDefault();

            var form = document.getElementById('registrationForm');
            var formData = new FormData(form);

            fetch('registro.php', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.text())
                .then(data => {
                    console.log(data);
                    alert("Usuario registrado exitosamente");
                })
                .catch(error => {
                    console.error('Error:', error);
                });
        }

        function loginUser(event) {
            event.preventDefault();

            var form = document.getElementById('loginFrom');
            var formData = new FormData(form);

            if (loginAttempts < 3) {
                fetch('loginu.php', {
                        method: 'POST',
                        body: formData
                    })
                    .then(response => response.json())
                    .then(data => {
                        console.log(data);

                        if (data.status === "success") {
                            alert("Usuario loggeado exitosamente");
                            window.location.href = "index.php";
                        } else {
                            alert(data.message);
                            loginAttempts++;
                            // Manejar cuenta bloqueada
                            if (data.message.includes('Cuenta bloqueada')) {
                                showBlockedButtons();
                            }
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
            } else {
                alert("Máximo de intentos agotados. Prueba en otra ocasión.");
            }
        }

        function showBlockedButtons() {
            var bloqueadoMessage = "La cuenta está bloqueada. Ponte en contacto con el soporte.";
            bloqueadoMessage += "<br><button onclick='redirectToRecuperarPage()'>Recuperar Contraseña</button>";
            bloqueadoMessage += "<button onclick='redirectToInicioPage()'>Ir a Inicio</button>";

            var dialog = document.createElement('div');
            dialog.innerHTML = bloqueadoMessage;

            dialog.style.padding = '10px';
            dialog.style.border = '1px solid #ccc';
            dialog.style.borderRadius = '5px';
            dialog.style.backgroundColor = '#fff';
            
            document.body.appendChild(dialog);
        }

        function redirectToRecuperarPage() {
            window.location.href = "recuperar.php";
        }

        function redirectToInicioPage() {
            window.location.href = "index.php";
        }
    </script>

</body>

</html>