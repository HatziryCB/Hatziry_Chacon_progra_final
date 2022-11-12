<%-- 
    Document   : RegistroLibro
    Created on : 11/11/2022, 13:30:37
    Author     : Hatziry Chacón
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Biblioteca</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="Js/Script.js" type="text/javascript"></script>
        
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            body{
                min-height: 100vh;
                background-image: url(https://images.wallpaperscraft.com/image/single/book_tulips_coffee_117577_3485x2614.jpg);
                background-size: 100%;
                background-position: center center;
                background-attachment: fixed;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">
                <img src="https://icon-library.com/images/home-icon-png/home-icon-png-28.jpg" width="30" height="30" class="d-inline-block align-top" alt="">
                Libreria
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="home.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="FormArticulo.jsp">Registrar autor</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Registrar libro</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link">Artículos registrados</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-outline-warning" href="Logout">Cerrar Sesion - ${UsuarioLogueado}</a>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="d-flex justify-content-around mx-4 my-5">
            <div class="shadow-lg p-3 bg-white rounded">
                <form method="POST" id="form" name="form" action="NewServlet">
                    <div class="mt-3 mb-5 mx-4">
                        <h2 class="display-4 text-center my-4">  REGISTRO DE ARTÍCULO</h2>
                        <div class="row my-3">
                            <div class="col">
                                <label for="codigo">Código</label>
                                <input type="int" class="form-control" placeholder="0123" name="codigo" id-="codigo">
                                <input type="hidden" name="control" value="GUARDAR">
                            </div>
                            <div class="col">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" placeholder="Ejem. Lampara Akyoler 380" name="nombre" id="nombre">
                            </div>
                        </div>
                        <div class="row my-3">
                            <div class="col">
                                <label for="editorial">Alias</label>
                                <input type="text" class="form-control" placeholder="Ejem. Lamparita" name="alias" id="alias">
                            </div>
                        </div>
                        <div class="row my-3">
                            <div class="col">
                                <label for="editorial">Fecha de ingreso</label>
                                <input type="text" class="form-control" placeholder="Ejem. 2019" name="fecha" id="fecha">
                            </div>
                            <div class="col">
                                <label for="inputState">Tipo de Artículo</label>
                                <select name="categoria" id="categoria" class="form-control">
                                    <option value="1" selected>Artículo 1</option>
                                    <option value="2">Artículo 2</option>
                                </select>
                            </div>
                            <button type="button" onclick="enviarDatos()" class="btn btn-primary mx-2 my-4">Registrar</button>
                            <button type="reset" class="btn btn-warning mx-2 my-4">Vaciar</button>
                        </div>
                </form>
            </div>
        </div>
        <div class="ml-4 my-5" style="width: 850px;" id="tablaContainer">
            <table class="table table-hover bg-white shadow-lg">
                <thead class="table-light">
                    <tr>
                        <td>Código</td>
                        <td>Nombre</td>
                        <td>Alias</td>
                        <td>Fecha de registro</td>
                        <td>Código categoría</td>
                    </tr>
                </thead>
                <tbody id="bodyTable">   
                </tbody>
            </table>
        </div> 

    </div>
</body>
</html>
