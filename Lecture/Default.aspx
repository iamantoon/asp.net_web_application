<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Lecture.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" type="text/css" href="styles.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Workers</title>
<script type="text/javascript">
    function hideButton() {
        document.querySelector('#Button1').style.visibility = 'hidden';
    }
</script>
</head>
<body style="background-color: #f6f6f6">
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" style="margin: 10px 0">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                    <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                    <asp:ImageField DataImageUrlField="ID" DataImageUrlFormatString="~/GetImage.ashx?id={0}" HeaderText="Photo" SortExpression="Photo" ControlStyle-Width="50" ControlStyle-Height="50"/>
                    <asp:BoundField DataField="Education" HeaderText="Education" SortExpression="Education" />
                    <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    <asp:TemplateField HeaderText="Властивості">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLinkDetails" runat="server" Text="Властивості" NavigateUrl='<%# "page2.aspx?id=" + Eval("ID") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button 
                ID="Button1" 
                runat="server" 
                Text="Новий" 
                class="button1" 
                OnClick="Button1_Click"
                OnClientClick="hideButton()"
            />
        </div>
    </form>
</body>
</html>