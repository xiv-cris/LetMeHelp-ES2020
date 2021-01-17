using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LetMeHelp.Models;

namespace LetMeHelp
{
    public partial class VerAnuncio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var _postId = int.Parse(Request.QueryString["postId"]);

            using(var db = new ModelLMH())
            {
                var post = db.Posts.ToList().Find(i => i.PostId == _postId);

                var user = db.Utilizadores.ToList().Find(i => i.UserId == post.UserId);

                Titulo.InnerText = post.PostHeader;

                descr.InnerText = post.PostDescription;

                contactMail.InnerText =  contactMail.InnerText + user.UserMail;
                contactPhone.InnerText = contactPhone.InnerText + user.UserPhone;
            }

            if(Session["uID"] == null)
            {
                ContactInfo.Visible = false;
            }
        }
    }
}