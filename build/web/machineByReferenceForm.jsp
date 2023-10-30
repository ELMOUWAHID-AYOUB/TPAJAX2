<%@page import="ma.school.beans.Machine"%>
<%@page import="ma.school.service.MachineService"%>
<%@page import="ma.school.beans.Marque"%>
<%@page import="ma.school.service.MarqueService"%>
<%@page import="java.util.Date"%>
<%@page import="ma.school.beans.Etudiant"%>
<%@page import="ma.school.service.EtudiantService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="style/css.css?version=2" rel="stylesheet" type="text/css"/>
        <link href="style/csslocal.css?version=2" rel="stylesheet" type="text/css"/>
        <script src="script/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="script/machineByMarque.js" type="text/javascript"></script>

    </head>
    <%@include file="template/menu.jsp" %>
    <body>
        <%@include file="template/header.jsp" %>
        
        <div class="content">
            <form method="GET" action="MachineController">
                <fieldset>
                    <legend>Selectionner Référence</legend>
                    <table border="0">

                        <tr>
                            <td>Réference</td>
                            <td>
                                <select id="marque" name="marque">
                                    <option value="0">Choisir une reference</option>
                                    <%
                                        MachineService mms = new MachineService();
                                        for (Machine m : mms.findAll()) {
                                    %>
                                    <option value="<%=m.getId()%>"><%=m.getReference() %></option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>


                    </table>
                </fieldset>
            </form>
            <%
               
            %>
            <fieldset>
                <legend>Liste des Machines</legend>

                <table border="1" class="tab">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Reference <br>
                            <th>Prix</th>
                            <th>Marque</th>
                            <th>Date d'achat</th>
                            <th>Supprimer</th>
                            <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody  id='body'>
                        
                       
                    </tbody>
                </table>

            </fieldset>
        </form>            
</body>
</html>
