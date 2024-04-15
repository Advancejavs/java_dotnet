<%@ Page Language="C#" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Loan Calculator</title>
</head>
<body>
    <form id="loanForm" runat="server">
        <div>
            <h2>Loan Calculator</h2>
            <div>
                <label for="loanAmount">Loan Amount:</label>
                <asp:TextBox ID="loanAmount" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="loanAmountValidator" runat="server" ControlToValidate="loanAmount"
                    ErrorMessage="* Required" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="loanAmountNumericValidator" runat="server" ControlToValidate="loanAmount"
                    ErrorMessage="* Numeric value only" ValidationExpression="^\d+(\.\d+)?$" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div>
                <label for="interestRate">Interest Rate (%):</label>
                <asp:TextBox ID="interestRate" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="interestRateValidator" runat="server" ControlToValidate="interestRate"
                    ErrorMessage="* Required" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="interestRateNumericValidator" runat="server" ControlToValidate="interestRate"
                    ErrorMessage="* Numeric value only" ValidationExpression="^\d+(\.\d+)?$" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div>
                <label for="duration">Duration (years):</label>
                <asp:TextBox ID="duration" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="durationValidator" runat="server" ControlToValidate="duration"
                    ErrorMessage="* Required" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="durationNumericValidator" runat="server" ControlToValidate="duration"
                    ErrorMessage="* Numeric value only" ValidationExpression="^\d+$" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>
            <div>
                <asp:Button ID="calculateButton" runat="server" Text="Calculate" OnClick="CalculateButton_Click" />
            </div>
            <div>
                <label for="result">Simple Interest:</label>
                <asp:Label ID="result" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
