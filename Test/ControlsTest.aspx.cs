using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SubmitButtom_Click(object sender, EventArgs e)
    {
        Result.Text = "Your name is " + YourName.Text;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Result.Text = "That went well I think o.o...";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Result.Text = "That went well... right? o.o...";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Result.Text = "What about this? o.o...";
    }
}