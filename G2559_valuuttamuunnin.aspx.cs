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

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      try
      {
        //muunnetaan käyttäjän antamat BitCoinit Euroiksi
        lblCurrency.Text = string.Format("{0:0.0000} euroa",
          float.Parse(txtCurrency.Text) * BitCoinRate);
        //näytetään suoritetut laskutoimitukset listboxissa
        lstOne.Items.Add(txtCurrency.Text + "-->" + lblCurrency.Text);
        lstTwo.Items.Add(txtCurrency.Text + "-->" + lblCurrency.Text);
      }
      catch (Exception ex)
      {
        lblCurrency.Text = ex.Message;
      }
    }
}
