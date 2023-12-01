<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="page4.aspx.cs" Inherits="Lecture.page4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="styles.css">
    <title>Результат верифікації</title>
    <script type="text/javascript">
    function hideButton() {
        document.querySelector('#Button1').style.visibility = 'hidden';
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 id="successMessage" class="success" runat="server">ВЕРИФІКАЦІЮ EMAIL-АДРЕСИ УСПІШНО ЗАВЕРШЕНО!</h1>
            <h1 id="failureMessage" class="failure" runat="server">ПОМИЛКА ВЕРИФІКАЦІЇ</h1>
            <asp:Button ID="Button1" runat="server" Text="НА ГОЛОВНУ" CssClass="button2" OnClick="Button1_Click" OnClientClick="hideButton()" />
        </div>
    </form>
</body>
</html>
