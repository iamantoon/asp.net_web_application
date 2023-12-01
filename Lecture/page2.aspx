<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page2.aspx.cs" Inherits="Lecture.page2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Властивості працівника</title>
    <script type="text/javascript">
    function hideButton() {
        document.querySelector('#Button1').style.visibility = 'hidden';
        document.querySelector('#Button3').style.visibility = 'hidden';
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="new-worker-container">
            <h1>ВЛАСТИВОСТІ ПРАЦІВНИКА</h1>
            <div>
                <!-- <img id="imgTag" src="avatar.png" alt="User profile picture" /> -->
                <asp:Image ID="imgTag" src="avatar.png" alt="User profile picture" runat="server" />
            </div>
            <div>
                <asp:Label ID="lblName" runat="server" Text="Прізвище та ініціали:" />
                <br />
                <asp:TextBox ID="txtName" runat="server" class="input" disabled></asp:TextBox>       
            </div> 
            <div class="email-container">
                <div>
                    <asp:Label ID="Label1" runat="server" Text="Email:" />
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" class="input" disabled></asp:TextBox>  
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
                    <asp:TextBox ID="txtEducation" runat="server" class="input" disabled></asp:TextBox>
                </div>
                 <div>
                     <asp:Label ID="lblPosition" runat="server" Text="Посада:" />
                     <br />
                     <asp:TextBox ID="txtPosition" runat="server" class="input" disabled></asp:TextBox>
                 </div>
            </div>
            <div>
                <asp:Label ID="lblEmploymentType" runat="server" Text="Тип зайнятості:" />
                <br />
                <asp:TextBox ID="TextBox2" runat="server" class="input" disabled></asp:TextBox>
            </div>
            <div class="email-container buttons">
                <!-- <asp:Button ID="Button2" runat="server" Text="ЗБЕРЕГТИ" CssClass="button2" /> -->
                <asp:Button ID="Button1" runat="server" Text="НАЗАД" CssClass="button2" OnClick="Button1_Click" OnClientClick="hideButton()" />
                <asp:Button ID="Button3" runat="server" Text="ПІДТВЕРДИТИ EMAIL" CssClass="button2" OnClick="Button3_Click" OnClientClick="hideButton()" />
            </div>
        </div>
    </form>
</body>
</html>
