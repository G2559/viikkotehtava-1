using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Collections;

public partial class LevykauppaX : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /*
    protected void BindDataList()
    {
        DirectoryInfo dir = new DirectoryInfo(MapPath("~/Images/"));
        FileInfo[] files = dir.GetFiles();
        ArrayList listItems = new ArrayList();
        foreach (FileInfo info in files)
        {
            listItems.Add(info);
        }
        DataListLevyt.DataSource = listItems;
        DataListLevyt.DataBind();

    }
    /*
    protected void btnsave_Click(object sender, EventArgs e)
    {
        string filename = Path.GetFileName(fileupload1.PostedFile.FileName);
        fileupload1.SaveAs(Server.MapPath("~/Images/" + filename));
        BindDataList();

    }
     * */
}