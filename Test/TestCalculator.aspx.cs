using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test_TestCalculator : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CalculateButtom_Click(object sender, EventArgs e)
    {
        double value1 = Convert.ToDouble(ValueBox1.Text);
        double value2 = Convert.ToDouble(ValueBox2.Text);
        double result = 0;
        Calculator myCalculator = new Calculator();
        switch (OperatorList.SelectedValue)
        {
            case "+":
                result = myCalculator.Add(value1, value2);
                break;
            case "-":
                result = myCalculator.Subtract(value1, value2);
                break;
            case "*":
                result = myCalculator.Multiply(value1, value2);
                break;
            case "/":
                result = myCalculator.Divide(value1, value2);
                break;
        }
        ResultLabel.Text = result.ToString();
    }
}