<%-- 
    Document   : index
    Created on : 13/12/2013, 19:37:26
    Author     : daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-latest.js">   
        </script>
        <script>
            $(document).ready(function() {                        
                $('#submit').click(function(event) {  
                    var username=$('#user').val();
//                 $.post('actionservlet',{user:username,pass:"secret"},function(responseText) { 
//                        $('#welcometext').text(responseText);         
//                    });
//                });
             
                $.getJSON( "actionservlet", { user:username,pass:"secret" } )
                                .done(function( json ) {
                                  $('#welcometext').text("usuario: "+json.user+" direccion: "+json.dir+" telefono: "+json.tel);
                                })
                                .fail(function( jqxhr, textStatus, error ) {
                                  var err = textStatus + ", " + error;
                                  alert( "Request Failed: " + err );
                              });


            });
        });
        </script>
    </head>
    <body>
        <form id="form1">
        <h1>AJAX Demo using Jquery in JSP and Servlet</h1>
        Enter your Name:
        <input type="text" id="user"/>
        <input type="button" id="submit" value="Ajax Submit"/>
        <br/>
        <div id="welcometext">
        </div>
        </form>
    </body>
</html>
