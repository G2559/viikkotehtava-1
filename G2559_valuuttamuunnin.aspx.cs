using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class G2559_valuuttamuunnin : System.Web.UI.Page
{
    private const float BitCoinRate = 94.71F;

    protected void Page_Load(object sender, EventArgs e)
    {
        //keskekekekekekekn
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //muunnetaan käyttäjän antamat BitCoinit euroiksi
        lblCurrency.Text = string.Format("{0:0.000} euroa", float.Parse(txtCurrency.Text) * BitCoinRate);

        //
        lstOne.Items.Add(txtCurrency.Text + "-->" + lblCurrency.Text);
        lstOne.Items.Add(txtCurrency.Text + "-->" + lblCurrency.Text);
    }
 
}