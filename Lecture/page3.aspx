<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page3.aspx.cs" Inherits="Lecture.page3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Верифікація email</title>
<script type="text/javascript">
    function hideButton() {
        document.querySelector('#Button1').style.visibility = 'hidden';
        document.querySelector('#Button2').style.visibility = 'hidden';
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>ВЕРИФІКАЦІЯ АДРЕСИ ЕЛЕКТРОННОЇ ПОШТИ</h2>
            <p>На Вашу адресу направлений одноразовий пароль. Введіть його в поле і натисніть "ДАЛІ":</p>
            <br />
            <asp:TextBox ID="TextBox1" runat="server" class="input"></asp:TextBox> 
            <div class="email-container buttons">
                <asp:Button ID="Button2" runat="server" Text="ДАЛІ" CssClass="button2" OnClick="Button2_Click" />
                <asp:Button ID="Button1" runat="server" Text="НАЗАД" CssClass="button2" OnClick="Button1_Click" />
            </div>
        </div>
    </form>
</body>
</html>
