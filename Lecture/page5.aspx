<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page5.aspx.cs" Inherits="Lecture.page5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Додати нового співробітника</title>
    <script type="text/javascript">
    function hideButton() {
        document.querySelector('#Button1').style.visibility = 'hidden';
        document.querySelector('#Button2').style.visibility = 'hidden';
        document.querySelector('#Button3').style.visibility = 'hidden';
    }
    </script>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div class="new-worker-container">
            <h1>ДОДАВАННЯ НОВОГО ПРАЦІВНИКА</h1>
            <div>
                <img src="avatar.png" alt="User profile picture" />
                <asp:FileUpload ID="FileUploadPhoto" runat="server" Text="BROWSE" />
                <!-- <asp:Button ID="ButtonUpload" runat="server" Text="BROWSE" OnClick="ButtonUpload_Click" CssClass="button2" /> -->
            </div>
            <div>
                <asp:Label ID="lblName" runat="server" Text="Прізвище та ініціали:" />
                <br />
                <asp:TextBox ID="txtName" runat="server" class="input"></asp:TextBox>       
            </div> 
            <div class="email-container">
                <div>
                    <asp:Label ID="Label1" runat="server" Text="Email:" />
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" class="input"></asp:TextBox>  
                </div>
                <div>
                    <asp:Label ID="lblEmailStatus" runat="server" Text="Email status:" />
                    <br />
                    <asp:TextBox ID="emailStatus" runat="server" class="input" disabled></asp:TextBox>
                </div>     
            </div>
            <div class="email-container">
                <div>
                    <asp:Label ID="lblEducation" runat="server" Text="Освіта:" />
                    <br />
                    <asp:TextBox ID="txtEducation" runat="server" class="input"></asp:TextBox>
                </div>
                 <div>
                     <asp:Label ID="lblPosition" runat="server" Text="Посада:" />
                     <br />
                     <asp:TextBox ID="txtPosition" runat="server" class="input"></asp:TextBox>
                 </div>
            </div>
            <div>
                <asp:Label ID="lblEmploymentType" runat="server" Text="Тип зайнятості:" />
                <asp:DropDownList ID="ddlEmploymentType" runat="server">
                    <asp:ListItem Value="1">Постійно</asp:ListItem>
                    <asp:ListItem Value="2">Тимчасово</asp:ListItem>
                    <asp:ListItem Value="3">Контракт</asp:ListItem>
                    <asp:ListItem Value="4">Звільнений</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="email-container buttons">
                <asp:Button ID="Button2" runat="server" Text="ЗБЕРЕГТИ" CssClass="button2" OnClick="Button2_Click" OnClientClick="hideButton()" />
                <asp:Button ID="Button1" runat="server" Text="НАЗАД" CssClass="button2" OnClick="Button1_Click" OnClientClick="hideButton()" />
                <asp:Button ID="Button3" runat="server" Text="ПІДТВЕРДИТИ EMAIL" CssClass="button2" />
            </div>
        </div>
    </form>
</body>
</html>
