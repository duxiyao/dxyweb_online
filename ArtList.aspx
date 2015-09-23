<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArtList.aspx.cs" Inherits="ArtList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
    <link href="css/skin.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
        $(function () { 
            $("#artlist").toggleClass("active");
            $("#artlist1").toggleClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="newsList_box" >  
          <ol >
          <%foreach (Model.Article art in artList)
            { %>
          <li>
            <a target="_blank" href="ArticleMaster.aspx?Id=<%=art.Id %>"><%=art.ArticleName %></a>
          </li> 
          <%} %>
          </ol>
          </div>
</asp:Content>

