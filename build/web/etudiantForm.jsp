<%@page import="java.util.Date"%>
<%@page import="ma.school.beans.Etudiant"%>
<%@page import="ma.school.service.EtudiantService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="script/script.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="script/jsonExemple.js" type="text/javascript"></script>
         <link href="style/css.css?version=2" rel="stylesheet" type="text/css"/>
        <link href="style/csslocal.css?version=2" rel="stylesheet" type="text/css"/>
        
        
    </head>
    <%@include file="template/menu.jsp" %>
    <body>
        
        <%@include file="template/header.jsp" %>
       
        <div class="content">
             <%
        String action = request.getParameter("action");
        EtudiantService etudiantService=new EtudiantService();
        

        if (action != null && action.equals("modifier")) {
            int etudiantId = Integer.parseInt(request.getParameter("id"));
            Etudiant etudiant = etudiantService.findById(etudiantId);
    %>
    <form action="EtudiantController" method="post">
        <fieldset>
            <legend>Modifier un etudiant</legend><br><br>

            <% if (etudiant != null) {%>
            <input type="hidden" name="id" value="<%= etudiant.getId()%>"/>
            <% }%>
             <table border="1">
                        <tr>
                            <td>Nom</td>
                            <td><input id="nom" type="text" name="nom" value="<%= (etudiant != null) ? etudiant.getNom(): ""%>"  required=""/></td>
                        </tr>
                        <tr>
                            <td>Prenom</td>
                            <td><input id="prenom" type="text" name="prenom" value="<%= (etudiant != null) ? etudiant.getPrenom(): ""%>" required="" /></td>
                        </tr>
                        <tr>
                            <td>Ville</td>
                            <td>
                                <select id="ville" name="ville" value ="<%= (etudiant != null) ? etudiant.getVille(): ""%>" >
                                    <option value="Rabat">Rabat</option>
                                    <option value="Fes">Fes</option>
                                    <option value="Marakech">Marrakech</option>
                   
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Date de naissance</td>
                            <td><input id="date" type="date" name="dateNaissance" value="<%= (etudiant != null) ? etudiant.getDateNaissance(): ""%>" required="" /></td>
                        </tr>
                        <tr>
                            <td>Sexe</td>
                            <td>M<input id="m" type="radio" name="sexe" value="<%= (etudiant != null) ? etudiant.getSexe(): ""%>" />
                                F<input id="f" type="radio" name="sexe" value="<%= (etudiant != null) ? etudiant.getSexe(): ""%>" checked="checked" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input name="op" type="submit" value="modifier" />
                                 <!--<button type="submit" class="bnupdate" name="modifier" style="width: 200px; margin-left: 190px;">Modifier</button>-->
                            </td>
                        </tr>
                    </table>

            
        </fieldset>
    </form>
                        <%
    } else {
    %>
    
            <form method="GET" action="EtudiantController">
                <fieldset>
                    <legend>Informations Etudiant</legend>
                    <table border="1">
                        <tr>
                            <td>Nom</td>
                            <td><input id="nom" type="text" name="nom" value=""  required=""/></td>
                        </tr>
                        <tr>
                            <td>Prenom</td>
                            <td><input id="prenom" type="text" name="prenom" value="" required="" /></td>
                        </tr>
                        <tr>
                            <td>Ville</td>
                            <td>
                                <select id="ville" name="ville">
                                    <option value="Rabat">Rabat</option>
                                    <option value="Fes">Fes</option>
                                    <option value="Marakech">Marrakech</option>

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Date de naissance</td>
                            <td><input id="date" type="date" name="dateNaissance" value="" required="" /></td>
                        </tr>
                        <tr>
                            <td>Sexe</td>
                            <td>M<input id="m" type="radio" name="sexe" value="homme" />
                                F<input id="f" type="radio" name="sexe" value="femme" checked="checked" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
<!--                                <input name="op" type="submit" value="Envoyer" />-->
                                <button id="deleteButton">Envoyer</button>
<!--                                 <button type="submit" class="bnupdate" name="op" style="width: 200px; margin-left: 190px;">Valider</button>-->
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>
     <%
    }
    %>
            <%
                EtudiantService es = new EtudiantService();
            %>
            <fieldset>
                <legend>Liste des étudiants</legend>

                <table border="1" class="tab">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nom <br>
                                <!--<input id="f" type="text" name="f" value="" /></th>-->
                            <th>Prenom</th>
                            <th>Ville</th>
                            <th>Date de naissance</th>
                            <th>Sexe</th>
                            <th>Supprimer</th>
                            <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Etudiant e : es.findAll()) {
                        %>
                        <tr>
                            <td><%=e.getId()%></td>
                            <td><%=e.getNom()%></td>
                            <td><%=e.getPrenom()%></td>
                            <td><%=e.getVille()%></td>
                            <td><%=e.getDateNaissance()%></td>
                            <td><%=e.getSexe()%></td>
                            <td><a class="bndelete" href="EtudiantController?op=delete&id=<%=e.getId()%>">Supprimer</a></td>
                            <td><a class="bnupdate" href="?action=modifier&id=<%=e.getId()%>">Modifier</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>

            </fieldset>

        </div>
               
<button id="deleteButton">S</button>
<script>
  function deleteItem() {
    if (confirm("Êtes-vous sûr de vouloir supprimer cet élément ?")) {
      // Mettez votre logique de suppression ici
      console.log("Élément supprimé !");
    } else {
      console.log("Suppression annulée.");
    }
  }

  document.getElementById('deleteButton').addEventListener('click', deleteItem);
</script>
    </body>
    <%@include file="template/footer.jsp" %>
</html>